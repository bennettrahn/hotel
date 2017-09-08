require_relative 'booking'
module Hotel
  class Block < Booking
    attr_reader :block_id

    def initialize(id, rooms, date_range, block_id)
      super(id, rooms, date_range)
      @block_id = block_id
      discount
    end

    def discount
      @total_cost -= @total_cost * 0.2
    end

    def reserve_room(num)
      if num > rooms_available.length
        raise ArgumentError.new "Not enough rooms in block."
      end
      rooms_to_reserve = []
      num.times do |i|
        self.rooms[i].reserved = true
        rooms_to_reserve << self.rooms[i]
      end
      booking = Booking.new(8, rooms_to_reserve, @date_range, block_id: @block_id)
      return booking
    end
    #write test to include rooms_available

    def rooms_available
      rooms_available = []
      @rooms.each do |room|
        if room.reserved == false
          rooms_available << room
        end
      end
      return rooms_available
    end
  end
end
