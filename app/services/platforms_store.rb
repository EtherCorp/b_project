class PlatformsStore
  def store_to_db(cache_platforms, game_relations, products)
    platforms = store_platforms(cache_platforms)
    game_asociations_store(platforms, game_relations)
  end

  def store_platforms(platforms)
    ids = Platform.import(platforms.values).ids
    platforms.each { |i, platform| platform['id'] = ids[i] }
  end

  def game_asociations_store(platforms, game_relations)
    # game_relations format: developer: [games_id]
    data = []
    platforms.each_value do |platform|
      data += make_relation(platform, game_relations)
    end

    data.each_slice(1000) do |s_data|
      make_sql_insert(s_data)
    end
  end

  def make_relation(platform, relations)
    data = []
    relations[platform['external_id']].each do |game|
      elem = {
        platform_id: company['id'],
        game_id: game['id'],
        product_id: platform.id #TODO
      }
      data << elem
    end
    data
  end

  def make_sql_insert(data)
    sql = 'INSERT INTO games_platforms (game_id, platform_id) VALUES '
    data.each do |d|
      sql += "(#{d['game_id']}, #{d['platform_id']})"
    end
    ActiveRecord::Base.connection.execute(sql)
  end
end
