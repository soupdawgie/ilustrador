require 'sinatra'
require 'sprockets'
require 'json'
require './lib/ilustrador'

class IlustradorSinatra < Sinatra::Base
  set :environment, Sprockets::Environment.new

  environment.append_path 'assets/fonts'
  environment.append_path 'assets/images'

  get '/assets/*' do
    env['PATH_INFO'].sub!('/assets', '')
    settings.environment.call(env)
  end

  get '/generate' do
    image = Ilustrador::Dispatcher.new(params).run
    content_type :json
    { status: 'generated', link_image: image }.to_json
  end

  get '/debug' do
    html = Ilustrador::Dispatcher.new(params).debug
  end

  get '/' do
    content_type :json
    { status: 'success' }.to_json
  end
end
