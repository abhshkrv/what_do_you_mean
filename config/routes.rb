Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "submissions#index"
  # Routes for the Reaction resource:

  # CREATE
  get("/reactions/new", { :controller => "reactions", :action => "new_form" })
  post("/create_reaction", { :controller => "reactions", :action => "create_row" })
  post("/create_reaction_from_submission", { :controller => "reactions", :action => "create_row_from_submission" })

  # READ
  get("/reactions", { :controller => "reactions", :action => "index" })
  get("/reactions/:id_to_display", { :controller => "reactions", :action => "show" })

  # UPDATE
  get("/reactions/:prefill_with_id/edit", { :controller => "reactions", :action => "edit_form" })
  post("/update_reaction/:id_to_modify", { :controller => "reactions", :action => "update_row" })

  # DELETE
  get("/delete_reaction/:id_to_remove", { :controller => "reactions", :action => "destroy_row" })
  get("/delete_reaction_from_submission/:id_to_remove", { :controller => "reactions", :action => "destroy_row_from_submission" })
  get("/delete_reaction_from_user/:id_to_remove", { :controller => "reactions", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Result resource:

  # CREATE
  get("/results/new", { :controller => "results", :action => "new_form" })
  post("/create_result", { :controller => "results", :action => "create_row" })

  # READ
  get("/results", { :controller => "results", :action => "index" })
  get("/results/:id_to_display", { :controller => "results", :action => "show" })

  # UPDATE
  get("/results/:prefill_with_id/edit", { :controller => "results", :action => "edit_form" })
  post("/update_result/:id_to_modify", { :controller => "results", :action => "update_row" })

  # DELETE
  get("/delete_result/:id_to_remove", { :controller => "results", :action => "destroy_row" })

  #------------------------------

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
  get("/delete_submission_from_user/:id_to_remove", { :controller => "submissions", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
