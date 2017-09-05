require 'pry'
require_relative 'spec_helper'

describe 'Room class' do
  before do
    @room1 = Hotel::Room.new(1)
  end
  it 'can be instantiated' do
    @room1.must_be_kind_of Hotel::Room
  end

  it 'room number and cost can be accessed' do
    @room1.number.must_equal 1
    @room1.cost.must_equal 200
  end
end
