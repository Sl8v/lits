#!/usr/bin/env ruby

class Configurator < File

  def self.usage
    abort "USAGE: #{$0} path_to_config_file"
  end


  config = ARGV[0]
  if self.size?(config) && self.file?(config)
    config_file = self.new config
    config_file.each_with_index  { |line, index|
      index += 1
      #puts "index: #{index+1} for line: #{line}"
      if line.include? ":"
        figure, params = line.split(":").map(&:strip)
        params = params.split(',').map(&:strip)
      else
        puts "#{index} WRONG figure: " +  index.to_s
        next
      end
      case figure
      when 'Circle'
        puts "#{index} OK CIRCLE" if params.size == 1
      when 'Rectangle'
        puts "#{index} OK Rectangle" if params.size == 2
      when 'Triangle'
        puts "#{index} OK Triangle" if params.size == 3
      else
        puts "#{index} WRONG figure" +  index.to_s
      end
    }
  else
    usage
#puts "bads"
  end

end
