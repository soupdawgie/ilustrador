require 'erb'
require 'yaml'
require 'imgkit'
require 'securerandom'

module Ilustrador
  class Image
    LAYOUT = File.read('lib/ilustrador/layout.html.erb')
    CONFIG = YAML.load_file('config/config.yaml')
    attr_reader :type, :text, :category

    def initialize(params)
      @type     = params[:type]
      @text     = params[:text]
      @category = params[:category]
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
