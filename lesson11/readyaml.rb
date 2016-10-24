require 'yaml'
#require 'filemagic'

my_config = YAML.load_file('config.yml')
db_name = my_config["default"]
sql_config = my_config[db_name]
