class TransactionPolicy
  attr_reader :user, :transaction

  def initialize(user, transaction)
    @user = user
    @transaction = transaction
  end

  def create?
    !user.nil? && user.persisted?
  end
end