require 'pry'
require_relative 'spec_helper'

describe 'Reservations class' do
  before do
    @hotel_res = Hotel::Reservations.new
    start_date = Date.new(2017,9,1)
    end_date = Date.new(2017,9,3)
    date_range = Hotel::DateRange.new(start_date, end_date)
    room = Hotel::Room.new(1)
    @reservation1 = Hotel::Reservation.new(1, [room], date_range)
  end
  describe 'initialize' do
    it 'can be instantiated' do
      @hotel_res.must_be_kind_of Hotel::Reservations
    end

    it 'creates all rooms' do
      @hotel_res.all_rooms.must_be_kind_of Array
      @hotel_res.all_rooms[0].must_be_kind_of Hotel::Room
    end

    it 'creates all_reservations' do
      @hotel_res.all_reservations.must_be_kind_of Array
    end
  end

  describe 'make_reservation' do
    it 'creates a new reservation' do
      @hotel_res.all_reservations[0].must_be_kind_of Hotel::Reservation
    end


  end
end
