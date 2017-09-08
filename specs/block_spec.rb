require_relative 'spec_helper'

describe 'make_block' do
  before do
    start_date = Date.new(2017,9,1)
    end_date = Date.new(2017,9,3)
    date_range = Hotel::DateRange.new(start_date, end_date)
    room = Hotel::Room.new(1)

    @block1 = Hotel::Block.new(1, [room], date_range)
  end
  it 'can be instantiated' do
    @block1.must_be_kind_of Hotel::Block
  end
  it 'makes a block of rooms' do

  end
  it "rooms can't be reserved, but aren't reserved" do

  end
  it "rooms can be booked within block" do

  end
end
