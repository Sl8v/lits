#!/usr/bin/env ruby

class FileSorter

  require 'mysql2'
  require 'mime/types'
  require 'yaml'
  #require 'filemagic'

  my_config = YAML.load_file('config.yml')

  @@client = nil
  @@query = ''

  def initialize path, base = 'downloads'
      @path = path
      @client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "toor", :database => "#{base}")
  end

  def show
      data = do_query
      data.each do |row|
      puts row
  end

end

  def read_folder path
    if Dir.exist? path
      Dir.chdir path

      Dir.foreach(path) do |item|
      next if item == '.' or item == '..'
      # if Dir.exist? item
      #   Dir.chdir item
      #   read_folder item
      # end
      if File.file?(item)
        puts item
    #    file2db item
    db_insert_file item
    db_insert_result
    mime = get_mime item
    mime_id = db_get_mime mime[0].to_s
    mime_id.each { |e| mime_id = e["id"]  }
    db_update_result mime_id
      end
      end
    end
  end

  def file2db filename
    db_insert 'files', {name: filename}

    db_select 'files', 'id'
  end

  def mime_morpheus
    MIME::Types.each { |mime| db_insert 'mimetypes', {name: mime} }
  end

  def get_mime file
     #FileMagic.open(:mime) { |fm| p fm.file(file) }
     MIME::Types.type_for(file).to_a
  end

  def db_insert_file filename
    @query= "INSERT INTO `files` (`id` , `name`) VALUES (NULL, '#{filename}');"
    do_query
  end

  def db_insert_result
    @query= "INSERT INTO `results` (`id`, `file_id`) VALUES (NULL, LAST_INSERT_ID());"
    do_query
  end

  def db_get_mime mime
    @query= "SELECT `id` from `mimetypes` where `name` = '#{mime}' ;"
    do_query
  end

  def db_update_result mime_id
    @query= "UPDATE `results` SET `mimetype_id` = '#{mime_id}' where `id` = (LAST_INSERT_ID());"
    do_query
  end

#   INSERT INTO foo (auto,text)
#     VALUES(NULL,'text');         # generate ID by inserting NULL
# INSERT INTO foo2 (id,text)
#     VALUES(LAST_INSERT_ID(),'text');  # use ID in second table
#

  def db_insert table, fields= {}
    #client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "toor", :database => "filesorter")
    @query= "INSERT INTO `#{table}` (`#{fields.keys.join('`, `')}`) VALUES ('"+fields.values.join("', '")+"');"
    do_query
  end

  def db_select table, fields='*'
    @query = "SELECT #{fields} from #{table} ;"
    self
  end

  # def where condition
  #    @query += " WHERE ..."
  #    `#{key}`='#{value}'
  #    self
  # end

  # def insert table, values= {}
  #   @query= "INSERT INTO `#{table}` (`#{values.keys.join('`, `')}`) VALUES ('"+values.values.join("', '")+"');"
  #   do_query
  # end

  # def select_by_name  # table, fields='*', statement
  #   statement = @client.prepare("SELECT #{fields} FROM `#{table}` where id = ? ")
  #   @res = statement.execute(statement)
  #   # self
  # end

  def do_query
    @client.query(@query)
  end

  def get
    do_query
  end

end
###################### do_query me #############################
pathdir  = "/home/hatchet/Videos"
dir = FileSorter.new(pathdir)

#dir.mime_morpheus   #RUN THIS ONCE, TODO: add checks for empty table

dir.db_select('mimetypes', "*" ).get
dir.read_folder(pathdir)
