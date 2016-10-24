# ruby encoding: utf-8
# usage: rake export:seeds_format
#        rake export:seeds_format > db/seeds.rb
# http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

models = %w[ User Twit Comment Tag TwitTag ]

namespace :export do
  desc "Prints Current DATA in a seeds.rb way."
  task :seeds_format => :environment do
    models.each do |name|
      name.singularize.classify.constantize.order(:id).all.each do |n|
        puts "#{name}.create(#{n.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
    end
  end
end
#     User.order(:id).all.each do |user|
#       puts "User.create(#{user.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
#     end
#
#     Twit.order(:id).all.each do |twit|
#       puts "Twit.create(#{twit.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
#     end
#
#     Comment.order(:id).all.each do |comment|
#       puts "Comment.create(#{comment.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
#     end
#
#     Tag.order(:id).all.each do |tag|
#       puts "Tag.create(#{tag.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
#     end
#
#     TwitTag.order(:id).all.each do |tt|
#       puts "TwitTag.create(#{tt.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
#     end
#
#
#   end
# end
