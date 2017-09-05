require 'pry'
require_relative 'spec_helper'

describe 'Reservation class' do
  before do
    start_date = Date.new(2017,9,1)
    end_date = Date.new(2017,9,3)
    @reservation1 = Hotel::Reservation.new(start_date, end_date)
  end
  describe 'initialize' do
    it 'can be instantiated' do
      @reservation1.must_be_kind_of Hotel::Reservation
    end

    xit 'creates a DateRange' do

    end
  end

end
