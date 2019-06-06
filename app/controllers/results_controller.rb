class ResultsController < ApplicationController
  def index
    @q = Result.ransack(params[:q])
    @results = @q.result(:distinct => true).includes(:submission).page(params[:page]).per(10)

    render("result_templates/index.html.erb")
  end

  def show
    @result = Result.find(params.fetch("id_to_display"))

    render("result_templates/show.html.erb")
  end

  def new_form
    @result = Result.new

    render("result_templates/new_form.html.erb")
  end

  def create_row
    @result = Result.new

    @result.submission_id = params.fetch("submission_id")
    @result.flags = params.fetch("flags")
    @result.confidence = params.fetch("confidence")

    if @result.valid?
      @result.save

      redirect_back(:fallback_location => "/results", :notice => "Result created successfully.")
    else
      render("result_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @result = Result.find(params.fetch("prefill_with_id"))

    render("result_templates/edit_form.html.erb")
  end

  def update_row
    @result = Result.find(params.fetch("id_to_modify"))

    @result.submission_id = params.fetch("submission_id")
    @result.flags = params.fetch("flags")
    @result.confidence = params.fetch("confidence")

    if @result.valid?
      @result.save

      redirect_to("/results/#{@result.id}", :notice => "Result updated successfully.")
    else
      render("result_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @result = Result.find(params.fetch("id_to_remove"))

    @result.destroy

    redirect_to("/results", :notice => "Result deleted successfully.")
  end
end
