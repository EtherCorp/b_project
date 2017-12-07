# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
stores= Store.create([{name: "zmart", home_page: "www.zmart.cl/"},{name: "weplay", home_page:"http://www.weplay.cl"},{name: "sniper",home_page:"http://www.sniper.cl"}])
currencies = Currency.create([{name: "Pesos Chilenos", symbol: "CLP"}])
products = Product.create([{name:"7 Days to Die "}])

#{ console: "ps4", name: "7 Days to Die ", price: "25900", availability: "Preguntar disponibilidad en tienda", site: "zmart", url: "https://www.zmart.cl/scripts/prodView.asp?idProduct=57519"}
#StoreProduct.create_with_params(parsed)
#ProductPrice.create_with_params(parsed)
#Falta: Sacar el punto del precio, esto se prueba con el json de la linea 12 por consola