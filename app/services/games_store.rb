class GamesStore
  def store_to_db(cache_data, relations)
    @cache_data = cache_data
    @relations = relations
    games = store_games
    make_relations(games)
    store_annexed_data(games)
  end

  def make_relations(games)
    make_relation!(@relations['developers'], games)
    make_relation!(@relations['publishers'], games)
    make_relation!(@relations['genres'], games)
    make_relation!(@relations['platforms'], games)
  end

  def make_relation!(relations, games)
    # relation: dev_ext_id => [games_ext_id]
    # objetive: dev_ext_id => [game_id]
    relations.each_key do |key|
      relations[key].each_with_index do |g_ext_id, pos|
        relations[key][pos] = { game_id: games[g_ext_id]['id'], game_ext_id: games[g_ext_id]['external_id'] }
      end
    end
  end

  def store_games
    games = filtered_games(@cache_data['games'].in_memory)
    games_id = Game.import(games.values).ids
    add_id_to_games(games, games_id)
  end

  def filtered_games(games_to_be_filtered)
    games = {}
    # only in memory data
    games_to_be_filtered.each do |key, game|
      games[key] = game.except('developers', 'publishers', 'alternative_names', 'genres', 'platforms')
    end
    games
  end

  def add_id_to_games(games, games_id)
    # Adds our database id to games
    games.each_with_index do |(key, value), index|
      games[key]['id'] = games_id[index]
    end
    games
  end

  def store_annexed_data(games)
    #products = store_products(games)
    store_companies
    store_genres
    #store_platforms(products)

  end

  def store_companies
    cache_devs = @cache_data['developers']
    cache_pubs = @cache_data['publishers']

    devs_rel = @relations['developers']
    pubs_rel = @relations['publishers']
    CompaniesStore.new.store_to_db(cache_devs, cache_pubs, devs_rel, pubs_rel)
  end

  def store_genres
    cache_genres = @cache_data['genres']
    genres_rel = @relations['genres']
    GenresStore.new.store_to_db(cache_genres, genres_rel)
  end

  def store_platforms
    cache_platforms = @cache_data['platforms']
    platforms_rel = @relations['platforms']
    PlatformsStore.new.store_to_db(cache_platforms, platforms_rel, products)
  end

  def store_products(games)
    # TO DO: make real products
    products = []
    games.each_value { |e| products << e.select(['name']) }
    product_ids = product.import(products).ids

    products_to_store = []
    products.each do |i, product|
      products_to_store << { 'id' => product_ids[i], 'name' => product['name'], 'game_id' => games['id'] }
    end
    results = Product.import(products)
    return false unless results
    results.ids
  end

  def store_alternative_names(games)
    data = []
    games.each_value do |game|
      game['alternative_names'].each do |alternative_name|
        data << { game_id: game['id'], name: alternative_name['name'] }
      end
    end
    GameAltName.import(data)
  end
end
