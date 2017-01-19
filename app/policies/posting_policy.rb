class PostingPolicy
  attr_reader :user, :posting

  def initialize(user, posting)
    @user = user
    @post = posting
  end

  def create?
    user.persisted?
  end
end