# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create("nickname"=>"user1", "email"=>"user1@yah.oo", "avatar"=>"")
User.create("nickname"=>"user2", "email"=>"u2@i.com", "avatar"=>"")
User.create("nickname"=>"user3", "email"=>"u3@ko.com", "avatar"=>"")
User.create("nickname"=>"qqq", "email"=>"qq", "avatar"=>"")
User.create("nickname"=>"robotic", "email"=>"robot@ic.io", "avatar"=>"https://avatars.slack-edge.com/2016-08-23/72154363424_75e2c076945cb401e6b8_192.png")
Twit.create("user_id"=>1, "content"=>"twit #2")
Twit.create("user_id"=>2, "content"=>"qqqqqeee")
Twit.create("user_id"=>4, "content"=>"")
Twit.create("user_id"=>4, "content"=>"welcome")
Twit.create("user_id"=>3, "content"=>"Aloha from UID3")
Comment.create("body"=>"eee", "twit_id"=>4, "user_id"=>0)
Comment.create("body"=>"ty\r\n", "twit_id"=>4, "user_id"=>2)
Comment.create("body"=>"11111", "twit_id"=>4, "user_id"=>1)
Comment.create("body"=>"wwwwwww", "twit_id"=>4, "user_id"=>2)
Comment.create("body"=>"2222", "twit_id"=>4, "user_id"=>22)
Comment.create("body"=>"2", "twit_id"=>4, "user_id"=>2)
Comment.create("body"=>"u1", "twit_id"=>4, "user_id"=>0)
Comment.create("body"=>"user1", "twit_id"=>4, "user_id"=>0)
Comment.create("body"=>"11", "twit_id"=>4, "user_id"=>1)
Comment.create("body"=>"vvvvv", "twit_id"=>3, "user_id"=>4)
Comment.create("body"=>"vv", "twit_id"=>3, "user_id"=>1)
Comment.create("body"=>"x", "twit_id"=>3, "user_id"=>1)
Comment.create("body"=>"s", "twit_id"=>3, "user_id"=>1)
Comment.create("body"=>"cc", "twit_id"=>8, "user_id"=>3)
Tag.create("name"=>"Odessa")
Tag.create("name"=>"Music")
Tag.create("name"=>"meetup")
Tag.create("name"=>"ruby")
Tag.create("name"=>"RoR")
TwitTag.create("twit_id"=>7, "tag_id"=>1)
TwitTag.create("twit_id"=>7, "tag_id"=>2)
TwitTag.create("twit_id"=>8, "tag_id"=>2)
TwitTag.create("twit_id"=>8, "tag_id"=>3)
TwitTag.create("twit_id"=>8, "tag_id"=>4)
