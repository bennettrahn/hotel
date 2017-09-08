module Hotel
  class Room
    attr_reader :number, :cost, :reserved

    def initialize(number, reserved: true)
      @number = number
      @cost = 200
      @reserved = reserved
    end
  end
end
