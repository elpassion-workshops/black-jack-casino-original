class Card < Struct.new(:pip, :suit)
  FACE_CODES = %w(J Q K)
  ACE_CODE = 'A'

  def face?
    pip.in? FACE_CODES
  end

  def ace?
    pip == ACE_CODE
  end
end
