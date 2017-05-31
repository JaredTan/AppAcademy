class Card

  attr_accessor :card_symbol, :face_value, :display_symbol

  def initialize(card_symbol)
    @card_symbol = card_symbol
    @face_value = :d
    @display_symbol = ''
  end

  def display_symbols
    @display_symbol = @card_symbol if @face_value == :u
    @display_symbol = '~' if @face_value == :d
  end
end
