require 'yaml'
#require 'filemagic'

my_config = YAML.load_file('config.yml')
p my_config
puts my_config["mysql"]["user"]
exit
