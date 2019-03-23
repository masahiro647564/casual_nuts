# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nuts = %w(アーモンド カシューナッツ ピスタチオ マカダミアナッツ 胡桃 ヘーゼルナッツ ピーナッツ ジャイアントコーン ミックスナッツ ピーカンナッツ)
genres = %w(デザート おやつ 和食  健康食品 洋食 ダイエット 中華 イタリアン フレンチ アジアン・エスニック )

nuts.each do |nut|
  Nut.create(name: nut)
end

genres.each do |genre|
  Genre.create(name: genre)
end