require 'sinatra'
require './lib/ilustrador'

  # format: image format (jpeg, png, gif)
  # resolution: resolution of the image (probably could be predefined)
  # category: post category (to be shown in the corner of an image)
  # text: fixed size string, font size depends on its length
  # logo: fixed size brand logo (could be processed on the server side)
  # background: background image (could be processed on the server side)
  # background-direction: direction of the gradient overlay (left-to-right (LR), top-to-bottom (TB), etc)
  # style: name of the predefined style (if any)
  # example link: http://localhost:4567/generate/type=fb&category=Movies&text=Watch the new trailer for Star Trek: Beyond

get '/generate/type=:type&category=:category&text=:text' do
  layout = Layout.new(params[:type], params[:category], params[:text])
  send_file layout.image
end
