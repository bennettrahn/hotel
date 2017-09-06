require 'date'

module Hotel
  class DateRange
    attr_reader :start_date, :end_date, :number_of_nights

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
      # check_valid
      @number_of_nights = (end_date - start_date).to_i
      check_valid

    end

    def check_valid
      raise ArgumentError.new("wrong dates") if @number_of_nights <= 0
    end

    def nights_arr
      nights_arr = []
      @number_of_nights.times do |i|
        nights_arr << (@start_date + i).day
      end
      return nights_arr
    end

  end
end
