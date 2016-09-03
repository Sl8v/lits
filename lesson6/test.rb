#!/usr/bin/env ruby


# words-pointers
old_name = 'Slav'
old_mail = 'sl8v@mailinator.com'
old_phone = '0635551234'

#test words-replacers
new_name = old_name.reverse
new_mail = old_mail.reverse
new_phone = old_phone.reverse

src_file = 'lesson4.html'
out_file = 'lesson6.html'

#arr = IO.readlines(src_file)
new_content = []

IO.foreach(src_file){|block|
   [old_name, old_mail, old_phone].all? { |word|
     block.include?(word)
       block.sub!(old_name, new_name)
       block.sub!(old_mail, new_mail)
       block.sub!(old_phone, new_phone)
#       puts block
     }
     new_content << block

 }

 #cloning block
 out = File.new(out_file, "w+")
 out.puts new_content
 out.close
