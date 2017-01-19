class PostingsController < ApplicationController
  
  def create
    @posting = Posting.new(posting_params)

    authorize(@posting)

    if params[:commit] == 'Preview'
      render :new
    elsif @posting.save
      redirect_to @posting
    else
      render :new
    end
  end
  
  def show
    @posting = Posting.find(params[:id])
  end
  
  def new
    @posting = Posting.new

    authorize(@posting)
  end
  
  private
  
  def posting_params
    params.require(:posting).permit(:user_id, :description, :job_title, :kind, :company_name, :company_location,
                                    :application_instructions)
  end
  
end