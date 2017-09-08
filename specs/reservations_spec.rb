require 'pry'
require_relative 'spec_helper'

describe 'Reservations class' do
  before do
    @hotel_res = Hotel::Reservations.new

    @start_date = Date.new(2017,9,1)
    @end_date = Date.new(2017,9,3)
    date_range = Hotel::DateRange.new(@start_date, @end_date)

    room = @hotel_res.all_rooms[0]
    booking1 = Hotel::Booking.new(1, [room], date_range)
    @hotel_res.all_reservations << booking1

    @booking2 = @hotel_res.make_booking(1, @start_date, @end_date)
  end
  describe 'initialize' do
    it 'can be instantiated' do
      @hotel_res.must_be_kind_of Hotel::Reservations
    end

    it 'creates all rooms' do
      @hotel_res.all_rooms.must_be_kind_of Array
      @hotel_res.all_rooms[0].must_be_kind_of Hotel::Room
      @hotel_res.all_rooms[0].number.must_equal 1
      @hotel_res.all_rooms.length.must_equal 20
    end

    it 'creates all_reservations' do
      @hotel_res.all_reservations.must_be_kind_of Array
    end
  end




  describe 'make_booking' do
    it 'creates a new booking' do
      @booking2.must_be_kind_of Hotel::Booking
    end

    it 'adds a booking to all_reservations' do
      @hotel_res.all_reservations[0].must_be_kind_of Hotel::Booking
      @hotel_res.all_reservations.length.must_equal 2
    end
    it 'still works for the first booking ever' do
      hotel_res_other = Hotel::Reservations.new
      hotel_res_other.make_booking(1, @start_date, @end_date).must_be_kind_of Hotel::Booking
      hotel_res_other.all_reservations.length.must_equal 1
    end

    it 'raises exception when no rooms are available' do
      @hotel_res.make_booking(18, @start_date, @end_date)
      proc {@hotel_res.make_booking(1, @start_date, @end_date)}.must_raise ArgumentError
    end

    it 'creates consecutive id numbers for new bookings' do
      @booking2.id.must_equal 2
      booking3 = @hotel_res.make_booking(1, @start_date, @end_date)
      booking3.id.must_equal 3
    end

    it 'chooses the next numerically consecutive room when previous are full' do
      @booking2.rooms[0].number.must_equal 2
      booking3 = @hotel_res.make_booking(1, @start_date, @end_date)
      booking3.rooms[0].number.must_equal 3
    end

    it 'makes bookings that can start on checkout day' do
      date1 = Date.new(2017,12,1)
      @hotel_res.make_booking(20, date1, (date1 + 1))
      @hotel_res.make_booking(20, (date1 + 2), (date1 + 3))

      proc {@hotel_res.make_booking(1, date1, (date1 + 1))}.must_raise ArgumentError
      proc {@hotel_res.make_booking(1, date1, (date1 + 2))}.must_raise ArgumentError
      @hotel_res.make_booking(1, (date1 + 1), (date1 + 2)).must_be_kind_of Hotel::Booking
    end
  end

  describe 'check_reserved' do
    it 'returns an array of rooms' do
      @hotel_res.check_reserved(@start_date, @end_date).must_be_kind_of Array
      @hotel_res.check_reserved(@start_date, @end_date)[0].must_be_kind_of Hotel::Room
    end

    it 'returns an empty/full array if nothing/everything is reserved on that day' do
      date1 = Date.new(2017,10,1)
      date2 = Date.new(2017,10,2)
      @hotel_res.check_reserved(date1, date2).must_be_empty
      @hotel_res.check_availability(date1, date2).length.must_equal 20

    end

  end

  describe 'check_availability' do
    it 'returns an array of rooms' do
      @hotel_res.check_availability(@start_date, @end_date).must_be_kind_of Array
      @hotel_res.check_availability(@start_date, @end_date)[0].must_be_kind_of Hotel::Room
    end

    it 'returns an empty array if everything is reserved on that day' do
      date1 = Date.new(2017,10,1)
      date2 = Date.new(2017,10,2)
      @hotel_res.make_booking(20, date1, date2)
      @hotel_res.check_availability(date1, date2).must_be_empty

    end
  end
end
