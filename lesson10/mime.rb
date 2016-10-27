
path = ARGV[0]
require 'mime/types'
Dir.foreach(path) do |f|
 p f
 puts MIME::Types.type_for(f)
end
