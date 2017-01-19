class PostingsController < ApplicationController
  
  def create
    @posting = Posting.new(posting_params)
    
    authorize(@posting)
    if @posting.save
      redirect_to postings_path
    else
      render :new
    end
  end
  
  def show
    @posting = Posting.find(params[:posting])
  end
  
  private
  
  def posting_params
    params.require(:posting).permit(:user_id, :description, :title, :kind, :company_name, :company_location,
                                    :application_instructions)
  end
  
end