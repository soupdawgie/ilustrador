require 'imgkit'
require 'digest'
require 'fileutils'

module Ilustrador
  class Dispatcher < Ilustrador::Base
    IMAGE_PATH = CONFIG['image_path']
    STATIC_PATH = CONFIG['static_path']

    attr_accessor :id, :params

    def initialize(params)
      @params = params
      @id     = params[:id]
    end

    def pretty_id
      sprintf('%03d', id)
    end

    def token
      Digest::MD5.hexdigest(params.to_s)
    end

    def image_path
      "#{IMAGE_PATH}/#{pretty_id}"
    end

    def static_path
      "#{STATIC_PATH}/#{pretty_id}"
    end

    def create_directory(path)
      FileUtils.mkdir_p(path)
    end

    def render_image(path)
      Image.new(params).render.to_file("#{path}/#{token}.png")
    end

    def run
      create_directory(image_path)
      render_image(image_path)

      "#{static_path}/#{token}.png"
    end

    def debug
      Image.new(params).layout
    end
  end
end
