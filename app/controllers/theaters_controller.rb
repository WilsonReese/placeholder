class TheatersController < ApplicationController
  def index
    matching_theaters = Theater.all

    @list_of_theaters = matching_theaters.order({ :created_at => :desc })

    render({ :template => "theaters/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_theaters = Theater.where({ :id => the_id })

    @the_theater = matching_theaters.at(0)

    render({ :template => "theaters/show.html.erb" })
  end

  def create
    the_theater = Theater.new
    the_theater.number_of_seats = params.fetch("query_number_of_seats")
    the_theater.turnover_time = params.fetch("query_turnover_time")
    the_theater.reservations_count = params.fetch("query_reservations_count")

    if the_theater.valid?
      the_theater.save
      redirect_to("/theaters", { :notice => "Theater created successfully." })
    else
      redirect_to("/theaters", { :alert => the_theater.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_theater = Theater.where({ :id => the_id }).at(0)

    the_theater.number_of_seats = params.fetch("query_number_of_seats")
    the_theater.turnover_time = params.fetch("query_turnover_time")
    the_theater.reservations_count = params.fetch("query_reservations_count")

    if the_theater.valid?
      the_theater.save
      redirect_to("/theaters/#{the_theater.id}", { :notice => "Theater updated successfully."} )
    else
      redirect_to("/theaters/#{the_theater.id}", { :alert => the_theater.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_theater = Theater.where({ :id => the_id }).at(0)

    the_theater.destroy

    redirect_to("/theaters", { :notice => "Theater deleted successfully."} )
  end
end
