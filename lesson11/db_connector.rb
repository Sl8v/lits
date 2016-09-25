#!/usr/bin/env ruby
require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "toor", :database => "figures")


results = client.query("SELECT figures.name , formulas.content from figures, formulas where formulas.figure_id = figures.id")

results.each do |row|
  # conveniently, row is a hash
  # the keys are the fields, as you'd expect
  # the values are pre-built ruby primitives mapped from their corresponding field types in MySQL
  puts "#{row["name"]} : #{row["content"]}"
end
