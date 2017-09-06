
# Reservations
# @all_rooms = room x 20
# @all_reservations = [reservation, reservation]
#
# def make_reservation(no_of_rooms, start_date, end_date)
#
#   date_range = DateRange.new(start_date, end_date)
#   # need to update reservation to accept date range as parameter rather than start, end
#   #this throws error if dates are wrong right away - begin rescue?
#   availability = check_availability
#   if availability.length < no_of_rooms
#     ArgumentError "not enough rooms"
#   elsif availability == []
#     ArgumentError "no rooms avail"
#   end
#
#   id = all_reservations.length
#   rooms = []
#   no_of_rooms.times do |i|
#     rooms << availability[i]
#   end
#
#   all_reservations << Reservation.new(id, rooms, date_range)
#
# end
