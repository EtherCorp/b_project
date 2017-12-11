# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
stores= Store.create([{name: "Zmart", home_page: "www.zmart.cl/"},{name: "Weplay", home_page:"http://www.weplay.cl"},{name: "Sniper",home_page:"http://www.sniper.cl"}])
currencies = Currency.create([{name: "Pesos Chilenos", symbol: "CLP"}])
products = Product.create([{name:"titanfall"}])
