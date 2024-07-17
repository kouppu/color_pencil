# frozen_string_literal: true

require_relative 'color_pencil/version'

module ColorPencil
  def self.new
    ColorPencil.new
  end

  class ColorPencil
    COLOR_CODES = {
      black: 30,
      red: 31,
      green: 32,
      yellow: 33,
      blue: 34,
      magenta: 35,
      cyan: 36,
      white: 37,
      default: 39,
    }.freeze

    def method_missing(method, *args)
      return super unless COLOR_CODES.key?(method)

      color_puts(method, args)
    end

    def respond_to_missing?(sym, include_private)
      COLOR_CODES.key?(sym) ? true : super
    end

    private

    def color_puts(color, *args)
      print "\e[#{COLOR_CODES[color.to_sym]}m"
      puts args
      print "\e[0m"
    end
  end
end
