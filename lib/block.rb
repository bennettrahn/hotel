require_relative 'booking'
module Hotel
  class Block < Booking
    attr_reader :block_id

    def initialize(id, rooms, date_range, block_id)
      # super
      super(id, rooms, date_range)
      @block_id = block_id
    end

    def reserve_room(num)
      rooms_reserved = []
      num.times do |i|
        self.rooms[i].reserved = true
        rooms_reserved << self.rooms[i]
      end
      booking = Booking.new(8, rooms_reserved, @date_range, block_id: @block_id)
    end

    def rooms_available
      rooms = []


    end
  end
end
