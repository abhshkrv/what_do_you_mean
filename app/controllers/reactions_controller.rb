class ReactionsController < ApplicationController
  def index
    @q = Reaction.ransack(params[:q])
    @reactions = @q.result(:distinct => true).includes(:user, :submission).page(params[:page]).per(10)

    render("reaction_templates/index.html.erb")
  end

  def show
    @reaction = Reaction.find(params.fetch("id_to_display"))

    render("reaction_templates/show.html.erb")
  end

  def new_form
    @reaction = Reaction.new

    render("reaction_templates/new_form.html.erb")
  end

  def create_row
    @reaction = Reaction.new

    @reaction.reaction = params.fetch("reaction")
    @reaction.user_id = params.fetch("user_id")
    @reaction.submission_id = params.fetch("submission_id")

    if @reaction.valid?
      @reaction.save

      redirect_back(:fallback_location => "/reactions", :notice => "Reaction created successfully.")
    else
      render("reaction_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_submission
    @reaction = Reaction.new

    @reaction.reaction = params.fetch("reaction")
    @reaction.user_id = params.fetch("user_id")
    @reaction.submission_id = params.fetch("submission_id")

    if @reaction.valid?
      @reaction.save

      redirect_to("/submissions/#{@reaction.submission_id}", notice: "Reaction created successfully.")
    else
      render("reaction_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @reaction = Reaction.find(params.fetch("prefill_with_id"))

    render("reaction_templates/edit_form.html.erb")
  end

  def update_row
    @reaction = Reaction.find(params.fetch("id_to_modify"))

    @reaction.reaction = params.fetch("reaction")
    @reaction.user_id = params.fetch("user_id")
    @reaction.submission_id = params.fetch("submission_id")

    if @reaction.valid?
      @reaction.save

      redirect_to("/reactions/#{@reaction.id}", :notice => "Reaction updated successfully.")
    else
      render("reaction_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @reaction = Reaction.find(params.fetch("id_to_remove"))

    @reaction.destroy

    redirect_to("/users/#{@reaction.user_id}", notice: "Reaction deleted successfully.")
  end

  def destroy_row_from_submission
    @reaction = Reaction.find(params.fetch("id_to_remove"))

    @reaction.destroy

    redirect_to("/submissions/#{@reaction.submission_id}", notice: "Reaction deleted successfully.")
  end

  def destroy_row
    @reaction = Reaction.find(params.fetch("id_to_remove"))

    @reaction.destroy

    redirect_to("/reactions", :notice => "Reaction deleted successfully.")
  end
end
