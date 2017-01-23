class PostingPolicy
  attr_reader :user, :posting

  def initialize(user, posting)
    @user = user
    @posting = posting
  end

  def create?
    !user.nil? && user.persisted?
  end
  
  def edit?
    !user.nil? && @posting.user_id == user.id
  end
  
  alias_method :update?, :edit?
  alias_method :new?, :create?
end