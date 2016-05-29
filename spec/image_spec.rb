RSpec.describe Ilustrador::Image do
  let(:params) { { type: 'fb', category: 'Elections 2016', text: 'Photographing the real Barack Obama' } }
  let(:image)  { Ilustrador::Image.new(params) }

  context '#file_name' do
    it 'returns a random string of 10 chars' do
      expect(image.file_name == image.file_name).to eq false
      expect(image.file_name.length).to eq 10
    end
  end

  context '#size' do
    it 'returns width/height of the image from the config file' do
      expect(image.size(:w)).to eq 1200
      expect(image.size(:h)).to eq 627
    end
  end

  context '#layout' do
    let(:layout) { image.layout }
    let(:width)  { image.size(:w) }
    let(:height) { image.size(:h) }

    it 'returns HTML after evaluating the ERB layout' do
      params.each do |key, value|
        expect(layout).to include value unless key == :type
      end
      expect(layout).to include "width: #{width}px;"
      expect(layout).to include "height: #{height}px;"
    end
  end

  context '#result' do
    it 'generates a png file' do
      # messy workaround, can't make 'change{}.by()' work by now
      before = Dir.glob('public/*.png').count
      image.result
      after = Dir.glob('public/*.png').count
      expect(after).to eq before + 1
    end
  end
end
