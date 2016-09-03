class Card < Struct.new(:value, :suit)
  FACE_VALUES = %w(J Q K)
  ACE_VALUE = 'A'

  def face?
    value.in? FACE_VALUES
  end

  def ace?
    value == ACE_VALUE
  end
end
