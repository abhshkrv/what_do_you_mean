Rails.application.routes.draw do
  # Routes for the Submission resource:

  # CREATE
  get("/submissions/new", { :controller => "submissions", :action => "new_form" })
  post("/create_submission", { :controller => "submissions", :action => "create_row" })

  # READ
  get("/submissions", { :controller => "submissions", :action => "index" })
  get("/submissions/:id_to_display", { :controller => "submissions", :action => "show" })

  # UPDATE
  get("/submissions/:prefill_with_id/edit", { :controller => "submissions", :action => "edit_form" })
  post("/update_submission/:id_to_modify", { :controller => "submissions", :action => "update_row" })

  # DELETE
  get("/delete_submission/:id_to_remove", { :controller => "submissions", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
