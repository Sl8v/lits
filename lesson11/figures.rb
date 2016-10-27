#!/usr/bin/env ruby

require 'mysql2'
require 'sqlite3'
require 'yaml'

class Database
  def initialize
    my_config = YAML.load_file('config.yml')
    current_db = my_config["default"]
    backend = my_config[current_db]
    @@client = Mysql2::Client.new(backend)

  end

  def show
    @result.each do |row|
    #  puts "#{row["id"]}, #{row["name"]}"
      puts row
    end
  end


  def select2 fields='*'
    @query = "SELECT #{fields} from `figures` ;"
    @result = @@client.query(@query)
    # self
  end

end

class Figure < Database
  def initialize
    @table = self.class.to_s.downcase + 's' # => figures
  end

  def select fields='*'
    @query = "SELECT #{fields} FROM `#{@table}` "
    self
  end

  # def from
  #   @query += "FROM `#{@table}`"
  #   self
  # end

  def where_id id
    @query += "WHERE id=#{id};"
    self
  end

  def where conditions
    @query += "WHERE #{conditions};"
    self
  end

  def do_query
    @result = @@client.query(@query)
  end

  def get id
    self.select.where_id(id).do_query
  end

  def get_by conditions = {}
    conditions.each do |k,v|
      puts k
      puts v
      self.select.where("#{k} = #{"v"}").do_query

    end
#    self.select.where('name="triangle"').do_query

    # self.select.where("#{conditions.keys[0].to_s}=#{conditions.values[0]}").do_query
  end



end
###### square CLASS
class Square < Database
  def initialize
  end

end

db = Database.new
p db.select2
db.show
#p db.show
f = Figure.new
f.select('name').where_id('1').do_query
f.get(2)
f.show
f.get_by(name: 'triangle')
f.show
