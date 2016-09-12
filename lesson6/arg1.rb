#!/usr/bin/env ruby
def usage
  abort "USAGE: #{$0} name=NEW_NAME phone=898908 email=test@t.co"
end

usage unless ARGV.size == 3

new_name, new_phone, new_email = nil, nil, nil


ARGV.each do |arg|
  case arg
  when /name=\w+$/       then new_name  = /name=(?<value>\w+$)/.match(arg)
  when /phone=[\d]+$/    then new_phone = /phone=(?<value>[\d]+$)/.match(arg)
  when /email=[\w.@]+$/  then new_email = /email=(?<value>[\w.@]+$)/.match(arg)
    else
      puts "bad argument: #{arg} <---"
      usage
  end
end

 puts "name: "  + new_name[:value]
 puts "phone: " + new_phone[:value]
 puts "email: " + new_email[:value]
 
