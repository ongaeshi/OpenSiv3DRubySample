class ColorSample
  def initialize(sym)
    @color = Palette.const_get(sym)
    @name = sym.to_s
  end

  def draw(font, x, y)
    Circle.new(x+10, y+10, 8).draw(@color)
    font[@name].draw(x+20, y, Palette::Black)
  end

  def inspect
    "#{@name}: #{@color}"
  end
end

Graphics.set_background(Palette::White)

font = Font.new(10)

samples = Palette.constants.map do |e|
  ColorSample.new(e)
end

while System.update do
  x = 0
  y = 0

  samples.each do |e|
    e.draw(font, x, y)
    x += 100
    if x >= 600
      x = 0
      y += 20
    end
  end
end
