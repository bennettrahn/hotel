require_relative 'booking'
module Hotel
  class Block < Booking

    def initialize(id, rooms, date_range)
      super
    end

    def reserve_room(num)
      num.times do |i|
        self.rooms[i].reserved = true
      end

    end

  end
end
