require 'date'

module Hotel
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
        raise ArgumentError.new "not enough rooms available for that date."
      end

      id = (@all_reservations.length + 1)
      rooms = []
      no_of_rooms.times do |i|
        room = availability[i]
        if block == true
          room.reserved = false
        end
        #add function to mark regular rooms as true
        rooms << room
      end

      if block == true
        true_or_false = true
      else
        true_or_false = false
      end

      booking = Booking.new(id, rooms, date_range, block: true_or_false)
      @all_reservations << booking
      return booking
    end

    def check_reserved(start_date, end_date)
      check_against = DateRange.new(start_date, end_date).nights_arr
      not_available = []

      check_against.each do |date|
      # check_against.each do |index|

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

    def reserve_room(num)


    end
  end
end
