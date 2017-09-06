require 'pry'
require_relative 'spec_helper'

describe 'Reservation class' do
  before do
    start_date = Date.new(2017,9,1)
    end_date = Date.new(2017,9,3)
    date_range = Hotel::DateRange.new(start_date, end_date)
    room = Hotel::Room.new(1)
    @reservation1 = Hotel::Reservation.new(1, [room], date_range)
  end
  describe 'initialize' do
    it 'can be instantiated' do
      @reservation1.must_be_kind_of Hotel::Reservation
    end

    it 'creates a DateRange for the reservation' do
      @reservation1.date_range.must_be_kind_of Hotel::DateRange
    end

    it 'creates an ID number' do
      @reservation1.id.must_equal 1
    end

    it 'has a total_cost' do
        @reservation1.total_cost.must_equal 200
    end
  end
  xdescribe 'add_room' do
    it 'should add room number to reserved rooms' do
      room1 = Hotel::Room.new(2)
      @reservation1.add_room(room1)
      @reservation1.rooms.length.must_equal 2
    end

    it 'should up the total_cost' do
      room1 = Hotel::Room.new(1)
      @reservation1.add_room(room1)
      @reservation1.total_cost.must_equal 200
    end
  end

end
