Rails.application.routes.draw do



  # Routes for the Reservation resource:

  # CREATE
  post("/insert_reservation", { :controller => "reservations", :action => "create" })
          
  # READ
  get("/reservations", { :controller => "reservations", :action => "index" })
  
  get("/reservations/:path_id", { :controller => "reservations", :action => "show" })
  
  # UPDATE
  
  post("/modify_reservation/:path_id", { :controller => "reservations", :action => "update" })
  
  # DELETE
  get("/delete_reservation/:path_id", { :controller => "reservations", :action => "destroy" })

  #------------------------------

  # Routes for the Theater resource:

  # CREATE
  post("/insert_theater", { :controller => "theaters", :action => "create" })
          
  # READ
  get("/theaters", { :controller => "theaters", :action => "index" })
  
  get("/theaters/:path_id", { :controller => "theaters", :action => "show" })
  
  # UPDATE
  
  post("/modify_theater/:path_id", { :controller => "theaters", :action => "update" })
  
  # DELETE
  get("/delete_theater/:path_id", { :controller => "theaters", :action => "destroy" })

  #------------------------------

  devise_for :users
end
