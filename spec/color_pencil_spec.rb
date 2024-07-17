# frozen_string_literal: true

RSpec.describe ColorPencil do
  it 'has a version number' do
    expect(ColorPencil::VERSION).not_to be nil
  end

  context 'when executing a color method' do
    it 'output color string' do
      color_pencil = ColorPencil.new
      expect { color_pencil.red 'foo' }.to output("\e[31mfoo\n\e[0m").to_stdout
    end

    it 'output color strings' do
      color_pencil = ColorPencil.new
      expect { color_pencil.red 'foo', 'bar', 'baz' }.to output("\e[31mfoo\nbar\nbaz\n\e[0m").to_stdout
    end
  end

  context 'when executing an undefined method' do
    it 'occur an exception' do
      color_pencil = ColorPencil.new
      expect { color_pencil.foo } .to raise_error(NoMethodError)
    end
  end
end
