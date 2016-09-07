require 'erb'
require 'yaml'
require 'imgkit'
require 'securerandom'
require 'base64'

module Ilustrador
  class Image
    LAYOUT = File.read('lib/ilustrador/layout.html.erb')
    CONFIG = YAML.load_file('config/config.yaml')

    attr_reader :type, :title, :section, :image

    def initialize(params)
      @type    = params[:type]
      @title   = params[:text]
      @section = params[:category]
      @image   = Base64.decode64(params[:image])
    end

    def file_name
      SecureRandom.urlsafe_base64(7)
    end

    def size(value)
      return CONFIG['size'][type][0] if value == :w
      return CONFIG['size'][type][1] if value == :h
    end

    def layout
      ERB.new(LAYOUT).result(binding)
    end

    def result
      kit = IMGKit.new(layout, quality: 100, width: size(:w))
      kit.to_png
      kit.to_file("public/#{file_name}.png")
    end
  end
end
