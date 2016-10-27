#!/usr/bin/env ruby

class FileSorter

  require 'mysql2'
  require 'mime/types'
  require 'filemagic'

  @@client = nil
  @@query = ''

  def initialize path, base = 'figures'
      @path = path
      path = path
      @client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "toor", :database => "#{base}")
  end

  def read_folder path #@path
    #Dir.chdir(@path)
    if Dir.exist? path
      Dir.chdir path

      Dir.foreach(path) do |item|
      next if item == '.' or item == '..'
      # if Dir.exist? item
      #   Dir.chdir item
       #read_folder item
  #    end
      puts item
      get_mime item
    end
    end
  end

  def get_mime file
     #FileMagic.open(:mime) { |fm| p fm.file(file) }
     puts MIME::Types.type_for(file)
  end

  def db_insert
    #client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "toor", :database => "filesorter")
    @query = "INSERT INTO `table` ....."
    @client.query(@query)
    #####
    results = @client.query("SELECT figures.name , formulas.content from `figures`, formulas where formulas.figure_id = figures.id")
    results.each do |row|
      puts "#{row["name"]} : #{row["content"]}"
    end
  end

  def db_select fields='*'
    @query = "SELECT #{fields}"
  end

end


#get_mime(ARGV[0])
#read_folder(".")

pathdir  = "/home/hatchet/Videos"
# dir = FileSorter.new("/home/hatchet/Downloads")
dir = FileSorter.new(pathdir)

dir.read_folder(pathdir)
# dir.db_insert
