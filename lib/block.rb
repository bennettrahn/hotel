require_relative 'booking'
module Hotel
  class Block < Booking

    def initialize(id, rooms, date_range)
      super
    end

    # def add_room(room)
    #   @rooms << room.number
    #   @total_cost += room.cost
    # end

  end
end
