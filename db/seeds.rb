# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "管理者",email: "admin@admin",password: "adminadmin",admin: true)
User.create(name: "ユーザー",email: "user@user",password: "useruser",admin: false,sales_id: 1)