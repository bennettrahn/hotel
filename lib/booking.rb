require 'date'

module Hotel
  class Booking
    attr_reader :id, :date_range, :rooms, :total_cost, :block_id

    # change to include: (id, rooms[], date_range)

    def initialize(id, rooms, date_range, block_id: nil)
      @id = id
      @date_range = date_range
      @rooms = rooms
      @total_cost = 0
      #this is a mess fix it
      @rooms.each { |room| @total_cost += room.cost}
      @block_id = block_id
    end

    

  end
end
