require 'date'

module Hotel
  class Reservation
    attr_reader :id, :date_range, :rooms, :total_cost

    def initialize(id, start_date, end_date)
      @id = id
      @date_range = DateRange.new(start_date, end_date)
      @rooms = []
      @total_cost = 0
    end

    def add_room(room)
      @rooms << room.number
      @total_cost += room.cost
    end

  end
end
