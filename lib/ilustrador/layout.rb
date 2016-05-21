class Layout
  RES    = { fb: [484, 252] }
  LAYOUT = File.read('lib/ilustrador/layout.html.erb')
  attr_accessor :type, :category, :text, :name

  def initialize(type, category, text)
    @type     = type
    @category = category
    @text     = text
    @name     = SecureRandom.urlsafe_base64(7)
  end

  def page
    ERB.new(LAYOUT).result(binding)
  end

  def image
    kit = IMGKit.new(page, quality: 100, width: RES[:fb][0])
    kit.to_png
    kit.to_file("public/#{name}.png")
  end
end
