# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([ name: 'Chicago' ,  name: 'Copenhagen' ])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#new_city_codes = {
#  АА: 'Киев',
#  АВ: 'Винницкая область',
#  АС: 'Волынская область',
#  АЕ: 'Днепропетровская область',
#  АН: 'Донецкая область',
#  АМ: 'Житомирская область',
#  АО: 'Закарпатская область',
#  АР: 'Запорожская область',
#  АТ: 'Ивано-Франковская область',
#  АІ: 'Киевская область',
#  АК: 'АР Крым',
#  ВА: 'Кировоградская область',
#  ВВ: 'Луганская область',
#  ВС: 'Львовская область',
#  ВЕ: 'Николаевская область',
#  ВН: 'Одесская область',
#  ВІ: 'Полтавская область',
#  ВК: 'Ровенская область',
#  ВМ: 'Сумская область',
#  ВО: 'Тернопольская область',
#  АХ: 'Харьковская область',
#  ВТ: 'Херсонская область',
#  ВХ: 'Хмельницкая область',
#  СА: 'Черкасская область',
#  СВ: 'Черниговская область',
#  СЕ: 'Черновицкая область',
#  СН: 'город Севастополь'
#}
#
#new_city_codes.each do |code, city|
#  NewCityCode.create!(code: code, city: city)
#end

User.delete_all
User.create!(email: 'a@mail.ru', name: 'Alex', password: 123123123, password_confirmation: 123123123)
User.create!(email: 'b@mail.ru', name: 'Boba', password: 123123123, password_confirmation: 123123123)





#Customer.create!(user_id: user1.id, number_code: 'ak1234 ab', name: 'Абдула')
#Customer.create!(user_id: user1.id, number_code: 'BT 1415 CA', name: 'василий')
#Customer.create!(user_id: user2.id, number_code: 'ak 4122 ab', name: 'дмитрий')














