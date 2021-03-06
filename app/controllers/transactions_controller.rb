class TransactionsController < ApplicationController
  
  def create    
    @charge = JobBoard::Stripe::CreateCharge.new({token: params[:stripeToken], 
                                                 email: current_user.email,
                                                 posting_id: params[:posting_id],
                                                 amount: params[:amount].to_i}).execute

    transaction = Transaction.new(transaction_params)
    authorize(transaction)
    
    if transaction.save
      posting = Posting.find(params[:posting_id])

      if params[:renewal]
        posting.expires_at = (posting.expires_at + 30.days)
      end
      
      posting.expired = false
      posting.save
      
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