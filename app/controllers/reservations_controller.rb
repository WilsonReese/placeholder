class ReservationsController < ApplicationController
  def index
    matching_reservations = Reservation.all

    @list_of_reservations = matching_reservations.order({ :created_at => :desc })

    render({ :template => "reservations/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reservations = Reservation.where({ :id => the_id })

    @the_reservation = matching_reservations.at(0)

    render({ :template => "reservations/show.html.erb" })
  end

  def create
    the_reservation = Reservation.new
    the_reservation.user_id = params.fetch("query_user_id")
    the_reservation.theater_id = params.fetch("query_theater_id")
    the_reservation.status = params.fetch("query_status")
    the_reservation.start = params.fetch("query_start")
    the_reservation.end = params.fetch("query_end")
    the_reservation.duration = params.fetch("query_duration")
    the_reservation.number_guests = params.fetch("query_number_guests")
    the_reservation.content_choice = params.fetch("query_content_choice")

    if the_reservation.valid?
      the_reservation.save
      redirect_to("/reservations", { :notice => "Reservation created successfully." })
    else
      redirect_to("/reservations", { :alert => the_reservation.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_reservation = Reservation.where({ :id => the_id }).at(0)

    the_reservation.user_id = params.fetch("query_user_id")
    the_reservation.theater_id = params.fetch("query_theater_id")
    the_reservation.status = params.fetch("query_status")
    the_reservation.start = params.fetch("query_start")
    the_reservation.end = params.fetch("query_end")
    the_reservation.duration = params.fetch("query_duration")
    the_reservation.number_guests = params.fetch("query_number_guests")
    the_reservation.content_choice = params.fetch("query_content_choice")

    if the_reservation.valid?
      the_reservation.save
      redirect_to("/reservations/#{the_reservation.id}", { :notice => "Reservation updated successfully."} )
    else
      redirect_to("/reservations/#{the_reservation.id}", { :alert => the_reservation.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_reservation = Reservation.where({ :id => the_id }).at(0)

    the_reservation.destroy

    redirect_to("/reservations", { :notice => "Reservation deleted successfully."} )
  end
end
