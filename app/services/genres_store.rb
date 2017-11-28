class GenresStore
  def store_to_db(cache_genres, game_relations)
    genres_in_mem = store_genres(cache_genres)
    # TO DO
    #genres = combine_memory_db(cache_genres, genres_in_mem)
    #store_with_relations(genres, game_relations)
  end

  def store_genres(genres)
    genres_in_mem = genres.in_memory.values
    ids = Genre.import(genres_in_mem).ids
    genres_in_mem.each_with_index { |(ext_id, _), index| genres_in_mem[ext_id]['id'] = ids[index] }
    genres_in_mem
  end

  def combine_memory_db(cache_genres, genres_in_mem)
    genres_in_mem.merge(cache_genres.in_db)
  end

  def store_with_relations(genres, game_relations)
    # game_relations format: developer: [games_id]
    data = []
    genres.each_value do |genre|
      data += make_relation(genre, game_relations)
    end

    data.each_slice(1000) do |s_data|
      make_sql_insert(s_data)
    end
  end

  def make_relation(genre, relations)
    data = []
    relations[genre['external_id']].each do |game|
      data << {
        genre_id: company['id'],
        game_id: game['id']
      }
    end
    data
  end

  def make_sql_insert(data)
    sql = 'INSERT INTO games_genres (game_id, genre_id) VALUES '
    data.each do |d|
      sql += "(#{d['game_id']}, #{d['genre_id']})"
    end
    ActiveRecord::Base.connection.execute(sql)
  end
end
