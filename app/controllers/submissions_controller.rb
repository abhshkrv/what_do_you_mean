class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.page(params[:page]).per(10)

    render("submission_templates/index.html.erb")
  end

  def show
    @reaction = Reaction.new
    @submission = Submission.find(params.fetch("id_to_display"))

    render("submission_templates/show.html.erb")
  end

  def new_form
    @submission = Submission.new

    render("submission_templates/new_form.html.erb")
  end

  def create_row
    @submission = Submission.new

    @submission.text = params.fetch("text")
    @submission.user_id = params.fetch("user_id")

    if @submission.valid?
      @submission.save

      redirect_back(:fallback_location => "/submissions", :notice => "Submission created successfully.")
    else
      render("submission_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @submission = Submission.find(params.fetch("prefill_with_id"))

    render("submission_templates/edit_form.html.erb")
  end

  def update_row
    @submission = Submission.find(params.fetch("id_to_modify"))

    @submission.text = params.fetch("text")
    

    if @submission.valid?
      @submission.save

      redirect_to("/submissions/#{@submission.id}", :notice => "Submission updated successfully.")
    else
      render("submission_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @submission = Submission.find(params.fetch("id_to_remove"))

    @submission.destroy

    redirect_to("/users/#{@submission.user_id}", notice: "Submission deleted successfully.")
  end

  def destroy_row
    @submission = Submission.find(params.fetch("id_to_remove"))

    @submission.destroy

    redirect_to("/submissions", :notice => "Submission deleted successfully.")
  end
end
