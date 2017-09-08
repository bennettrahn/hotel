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

# #this is in the wrong place?
# it 'can reserve a room within a block' do
#   @block_booking.reserve_room(1)
#   @block_booking.rooms.length.must_equal 5
#   @block_booking.rooms[0].reserved.must_equal true
# end
#
# it 'only works on blocks' do
#   @booking2.reserve_room(1).must_equal "not a block"
# end

# it "can be a part of a block, but default isn't." do
#   @booking1.block.must_equal false
#   booking2 = Hotel::Booking.new(1, [@room], @date_range, block: true)
#   booking2.block.must_equal true
# end
