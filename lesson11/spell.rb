#require 'mime/types'

require 'mysql2'



class Database

  def initialize base
    @client= Mysql2::Client.new(:host => "localhost", :username => "root", :password=>"root" )
    @client.query("use `#{base}`")
  end

  def show
    @data.each do |row|
      puts row
    end
  end

  def where condition
     @query += " WHERE ..."
     `#{key}`='#{value}'
     self
  end

  def select fields='*'
    @query= "SELECT #{fields} FROM `typetable`"
    self
  end

  def insert table, values= {}
    @query= "INSERT INTO `#{table}` (`#{values.keys.join('`, `')}`) VALUES ('"+values.values.join("', '")+"');"
    run
  end

  def update values={}
    @query= "UPDATE `typetable` SET `image`='#{value}'"
    run
  end

  def run
    @client.query(@query)
  end

  def get
    run
  end
end


db= Database.new 'slippy'

db.insert 'typetable', {:id=>1, :image=> 'asdasda', :videoaudio=>'just simple text'}

db.select("*").where({:videoaudio=>'1', :test=>'2'}).get
db.where.update('typetable', {:image=> 'asdasda', :videoaudio=>'just simple text'})

#puts db.select("*")

=begin

.each do |row|

  puts row

end

=end

#db.show
