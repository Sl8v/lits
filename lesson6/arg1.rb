#!/usr/bin/env ruby

#ruby test.rb name=Test phone=898908 email=test@t.co

#args = Hash[ ARGV.flat_map{|s| s.scan(/--?([^=\s]+)(?:=(\S+))?/) } ]
args = {}
ARGV.each do |arg|
  match = /(?<key>.*?)=(?<value>.*)/.match(arg)
  args[match[:key]] = match[:value]
end

  puts args['name'] + ' ' + args['phone']
  puts ARGV.size

# new_name = ARGV[0]
# new_mail = ARGV[1]
# new_phone = ARGV[2]
#
# puts new_name
# puts new_mail
# puts new_phone
