class PostingsController < ApplicationController
  
  def index
    if params[:user_id] && (current_user && current_user.id == params[:user_id].to_i)
      @user = current_user
      @postings = @user.postings
    else
      redirect_to root_url
    end
  end
  
  def edit
    @posting = Posting.find(params[:id])
    
    authorize(@posting)
    
    render :edit
  end
  
  def update
    @posting = Posting.find(params[:id])

    authorize(@posting)
    
    if @posting.update(posting_params)
      redirect_to posting_path(@posting)
    else
      render :edit
    end
  end
  
  def create
    @posting = Posting.new(posting_params)

    authorize(@posting)

    if (params[:commit] == 'Preview') || (params[:commit] == "Edit")
      render :new
    elsif @posting.save
      @amount = Posting::POSTING_FEE
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
                                    :application_instructions, :logo)
  end
  
end