#!/usr/bin/env ruby
def usage
  abort "USAGE: #{$0} name=NEW_NAME phone=898908 email=test@t.co"
end
usage unless ARGV.size == 3

#CONFIG and predefinements
new_name, new_phone, new_email, new_content = nil, nil, nil, []
old_name  = 'Slav'
old_mail  = 'sl8v@mailinator.com'
old_phone = '0635551234'
src_file  = 'lesson4.html'
out_file  = 'lesson6.html'
 
#args validation
ARGV.each do |arg|
  case arg
  when /name=[a-zA-Z]+$/ then new_name  = /name=(?<value>[a-zA-Z]+$)/.match(arg)
  when /phone=[\d]+$/    then new_phone = /phone=(?<value>[\d]+$)/.match(arg)
  when /email=[\w.@]+$/  then new_email = /email=(?<value>[\w.@]+$)/.match(arg)
    else
      puts "bad argument: #{arg} <---"
      usage
  end
end

# update values in file
IO.foreach(src_file){ |string|
   [old_name, old_mail, old_phone].all? { |word|
     string.include?(word)
       string.sub!(old_name,   new_name[:value])
       string.sub!(old_mail,  new_email[:value])
       string.sub!(old_phone, new_phone[:value])
     }
     new_content << string
 }

 #save to new file
 out = File.new(out_file, "w+")
 out.puts new_content
 out.close

 puts "All done, see updated file #{out_file} with values:"
 puts "name: "  + new_name[:value]
 puts "phone: " + new_phone[:value]
 puts "email: " + new_email[:value]
