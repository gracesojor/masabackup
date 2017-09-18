# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Maker.create!(name: "マルハン"
              )
Maker.create!(name: "藤商事"
              )
Maker.create!(name: "サミー"
              )    
              
              
User.create!(name: "caster",
             email: "exampleexample@example.com",
             password: "example",
             password_confirmation: "example",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now
             
             )
             
             
      
10.times do |n|
# this is loop
 name = Faker::Name.name
 email = "user-#{n+1}@example.com"
 password = "password"
 User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now
              )
end


   
    

10.times do |n|
 

 number = Faker::Number.between(1, 10)
 user_id = Faker::Number.number(1)
 price = Faker::Number.number(6)
 removal_date = Faker::Time.between(DateTime.now - 1, DateTime.now)
 
 @maker = ["サミー", "京楽", "オリンピア", "藤商事", "タイヨーエレック", "ＥＸＣＩＴＥ"]
 @name = ["ＣＲ戦国乙女４～花～３１９ｖｅｒ．【Ｈ１ＢＹ８】", "ＣＲルパン三世～Ｉ’ｍ　ａ　ｓｕｐｅｒ　ｈｅｒｏ～不二子におまかせ　１７８ｖｅｒ．【８Ｌ７ＢＺ】", "ＣＲ火曜サスペンス劇場２ＬＫＩ　真相の扉～２２の過ち～", "ＣＲ天元突破グレンラガン　ラゼンガンＶｅｒ．【ＬＮＡ】", "  デジハネＣＲスーパーロボット大戦ＯＧＱＴＡ【甘デジ】"]
 @places = ["北海道", "神奈川県", "滋賀県", "大阪府", "京都府"]
 @remnant = ["あり", "無し"]
 @type_machine = ["本体", "セル"]
 @condition = ["A", "B", "C"]
 @stage = ["１次", "２次"]
 @remarks = ["ボッロボロ", "綺麗", "担当は山田", "値段要相談", "送料別（１０００円）"]

 name = @name.shuffle.sample
 maker = @maker.shuffle.sample
 place = @places.shuffle.sample
 remnant = @remnant.shuffle.sample
 stage = @stage.shuffle.sample
 condition = @condition.shuffle.sample
 remarks = @remarks.shuffle.sample
 type_machine = @type_machine.shuffle.sample
 
 #カスタムのseedはそもそもfakerプラグインは使わない。

 Sell.create!(name: name,
              maker: maker,
              number: number,
              user_id: user_id,
              place: place,
              price: price,
              removal_date: removal_date.strftime("%y/%m/%d"),
              remnant: remnant,
              stage: stage,
              condition: condition,
              remarks: remarks,
              type_machine: type_machine,

              )
end



 # default admin is false
 # 増やしたい時はtimesの数変えるだけ。
 # 減らしたい時は一旦 rake db:reset する必要
 
 
# users = User.order(:created_at).take(6)
# 50.times do
#  content = Faker::Lorem.sentence(5)
#  # Lorem - dummytext
#  # 5 は、最大5のlengthのtextという意味
 
#  users.each { |user| user.microposts.create!(content: content) }
# end



# # Following relationships
# users = User.all
# #fromユーザーテーブル

# user  = users.first
# following = users[2..50]
# #userのIDの２から５０
# followers = users[3..40]
# #userのIDの３から４０

# following.each { |followed| user.follow(followed) }
# #followingの単数系がfollowed
# followers.each { |follower| follower.follow(user) }
# #フォローイングに関するseeds
