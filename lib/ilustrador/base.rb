require 'yaml'

module Ilustrador
  class Base
    LAYOUT = File.read('layouts/primary.html.erb')
    CONFIG = YAML.load_file('config/config.yaml')
    ROOT   = CONFIG['url']
  end
end
