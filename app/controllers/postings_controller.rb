class PostingsController < ApplicationController
  
  def create
    @posting = Posting.new(posting_params)

    authorize(@posting)

    if params[:commit] == 'Preview'
      render :new
    elsif @posting.save
      render :new
    else
      render :new
    end
  end
  
  def show
    @posting = Posting.find(params[:id])
  end
  
  def new
    @posting = Posting.new
    @amount = Posting::POSTING_FEE

    authorize(@posting)
  end
  
  def renew
    @posting = Posting.find(params[:posting_id])
    @renewal = true
    @amount = Posting::RENEWAL_FEE
  end
  
  private
  
  def posting_params
    params.require(:posting).permit(:user_id, :description, :job_title, :kind, :company_name, :company_location,
                                    :application_instructions)
  end
  
end