require 'date'

module Hotel
  class RoomQuantityError < StandardError
  end

  class Reservations
    attr_reader :all_rooms, :all_reservations

    def initialize
      @all_rooms = []
      create_rooms

      @all_reservations = []


    end

    def create_rooms
      20.times do |i|
        num = i + 1
        @all_rooms << Room.new(num)
      end
    end


    def make_booking(no_of_rooms, start_date, end_date, block: false)

      date_range = DateRange.new(start_date, end_date)
      #this throws error if dates are wrong right away - begin rescue?
      availability = check_availability(start_date, end_date)
      if availability.length < no_of_rooms
        raise RoomQuantityError.new "not enough rooms available for that date."
      end

      id = (@all_reservations.length + 1)
      rooms = []
      no_of_rooms.times do |i|
        room = availability[i]
        if block == true
          room.reserved = false
        else
          room.reserved = true
        end
        rooms << room
      end

      if block == true
        if no_of_rooms > 5
          raise RoomQuantityError.new("Blocks can have a maximum of 5 rooms")
        end
        block_id = id
        booking = Block.new(id, rooms, date_range, block_id)
      else
        booking = Booking.new(id, rooms, date_range)
      end

      @all_reservations << booking
      return booking
    end

    def check_reserved(start_date, end_date)
      check_against = DateRange.new(start_date, end_date).nights_arr
      not_available = []

      check_against.each do |date|
        @all_reservations.each do |booking|
          if booking.date_range.include?(date)
            booking.rooms.each do |room|
              not_available << room
            end
          end
        end
      end
      return not_available
    end

    def check_availability(start_date, end_date)
      available = []
      @all_rooms.each do |room|
        if check_reserved(start_date, end_date).include?(room) == false
          available << room
        end
      end
      return available
    end

    def reserve_block_room (block, num)
      if num > block.rooms_available.length
        raise RoomQuantityError.new "Not enough rooms in block."
      end

      rooms_to_reserve = []
      num.times do |i|
        block.rooms[i].reserved = true
        rooms_to_reserve << block.rooms[i]
      end

      res_id = @all_reservations.length + 1

      booking = Booking.new(res_id, rooms_to_reserve, block.date_range, block_id: block.block_id)

      @all_reservations << booking
      return booking
    end


  end
end
