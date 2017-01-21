class TransactionsController < ApplicationController
  
  def create    
    @charge = JobBoard::Stripe::CreateCharge.new({token: params[:stripeToken], 
                                                 email: current_user.email,
                                                 posting_id: params[:posting_id],
                                                 amount: 150}).execute

    transaction = Transaction.new(transaction_params)
    
    if transaction.save
      posting = Posting.find(params[:posting_id])
      
      redirect_to posting_path(posting) 
    else
      render :new
    end
  end
  
  private
  
  def transaction_params
    { posting_id: params[:posting_id], user_id: current_user.id, transaction_id: @charge.id, status: @charge.status, amount: @charge.amount }
  end
  
end