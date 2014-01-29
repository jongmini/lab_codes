# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#  cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#  Mayor.create(name: 'Emanuel', city: cities.first)
products = []
products << Product.create(name: 'iphone')
products << Product.create(name: 'galaxy S4')
products << Product.create(name: 'PS4')
products << Product.create(name: 'linens')
products << Product.create(name: 'TV')
products << Product.create(name: 'bed')
products << Product.create(name: 'gamecube')
products << Product.create(name: 'chair')
products << Product.create(name: 'table')
products << Product.create(name: 'imac')

categories = []
categories<< Category.create(name: 'home')
categories<< Category.create(name: 'apple')
categories<< Category.create(name: 'furniture')
categories<< Category.create(name: 'electronics')

categories[0].products << products[-1]
categories[0].products << products[-2]
categories[0].products << products[-3]
categories[0].products << products[-4]
categories[0].products << products[-5]
categories[0].products << products[-6]
categories[0].products << products[-7]
categories[0].products << products[-8]

categories[1].products << products[-1]
categories[1].products << products[-10]

categories[2].products << products[-2]
categories[2].products << products[-3]
categories[2].products << products[-5]

categories[3].products << products[-1]
categories[3].products << products[-4]
categories[3].products << products[-6]
categories[3].products << products[-8]
categories[3].products << products[-9]
categories[3].products << products[-10]