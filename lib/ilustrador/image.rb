require 'erb'
require 'imgkit'
require 'base64'

module Ilustrador
  class Image < Ilustrador::Base
    HEIGHT = CONFIG['size']['fb']['height']
    WIDTH  = CONFIG['size']['fb']['width']

    attr_accessor :type, :section, :title, :image

    def initialize(params)
      @type    = params[:type]
      @title   = params[:title]
      @section = params[:section]
      @image   = CONFIG['url'] + Base64.urlsafe_decode64(params[:image])
    end

    def layout
      ERB.new(LAYOUT).result(binding)
    end

    def render
      kit = IMGKit.new(layout, quality: 100, width: WIDTH)
      kit.to_png
      kit
    end
  end
end
