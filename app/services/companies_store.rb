class CompaniesStore
  def store_to_db(cache_devs, cache_pubs, devs_relations, pubs_relations)
    create_roles
    companies = as_company_array(cache_devs, cache_pubs)
    companies = store_companies(companies)
    store_with_role(companies, devs_relations, pubs_relations)
  end

  def create_roles
    @developer = CompanyRole.find_or_create_by(name: 'developer')
    @publisher = CompanyRole.find_or_create_by(name: 'publisher')
  end

  def store_companies(companies)
    # companies format: external_id => company_hash
    filtered_companies = companies[:in_memory].values.map { |e| e.except('developer', 'publisher') }
    # puts filtered_companies
    ids = Company.import(filtered_companies).ids
    companies[:in_memory].each_key { |i| companies[:in_memory][i]['id'] = ids[i] }
    companies
  end

  def store_with_role(companies, devs_relations, pubs_relations)
    # game_relations format: developer: [games_id]
    all_companies = combine_companies(companies)
    rels = []
    all_companies.each_value do |company|
      rels += make_involved_data(company, devs_relations, @developer.id) if company['developer']
      rels += make_involved_data(company, pubs_relations, @publisher.id) if company['publisher']
    end
    # TO DO
    # InvolvedCompany.import(rels)
  end

  def make_involved_data(company, relations, role_id)
    data = []
    relations[company['external_id']].each do |game|
      data << {
        company_id: company['id'],
        game_association_id: game['id'],
        role_id: role_id
      }
    end
    data
  end

  def as_company_array(devs, pubs)
    in_memory = cache_to_companies(devs.in_memory, pubs.in_memory)
    in_db = cache_to_companies(devs.in_db, pubs.in_db)
    { in_memory: in_memory, in_db: in_db }
  end

  def cache_to_companies(devs, pubs)
    devs.each_key { |id| devs[id]['developer'] = true }
    pubs.each_key { |id| pubs[id]['publisher'] = true }
    devs.merge(pubs)
  end

  def combine_companies(companies)
    companies[:in_memory].merge(companies[:in_db])
  end
end
