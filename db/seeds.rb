# Create admin user
FactoryGirl.create(:user, :admin)

# Create generic user
@user = FactoryGirl.create(:user, email: "jmannonpdx@gmail.com")

# Create programming postings
FactoryGirl.create(:posting, :programming, user: @user, expired: false)
FactoryGirl.create(:posting, :programming, user: @user, expires_at: 31.days.ago, expired: true)
FactoryGirl.create(:posting, :programming, user: @user, expires_at: 50.days.from_now, expired: false)

# Create marketing postings
FactoryGirl.create(:posting, :marketing, user: @user, expired: false)
FactoryGirl.create(:posting, :marketing, user: @user, expires_at: 31.days.ago, expired: true)
FactoryGirl.create(:posting, :marketing, user: @user, expires_at: 50.days.from_now, expired: false)

# Create design postings
FactoryGirl.create(:posting, :design, user: @user, expired: false)
FactoryGirl.create(:posting, :design, user: @user, expires_at: 31.days.ago, expired: true)
FactoryGirl.create(:posting, :design, user: @user, expires_at: 50.days.from_now, expired: false)

# Create devops postings
FactoryGirl.create(:posting, :devops, user: @user, expired: false)
FactoryGirl.create(:posting, :devops, user: @user, expires_at: 31.days.ago, expired: true)
FactoryGirl.create(:posting, :devops, user: @user, expires_at: 50.days.from_now, expired: false)

# Create customer_support postings
FactoryGirl.create(:posting, :customer_support, user: @user)
FactoryGirl.create(:posting, :customer_support, user: @user, expires_at: 31.days.ago, expired: true)
FactoryGirl.create(:posting, :customer_support, user: @user, expires_at: 50.days.from_now)

def create_transactions
  Posting.all.each do |p|
    Transaction.create(posting: p, user: @user, transaction_id: 'test', status: 'paid', amount: BigDecimal.new('150'))
  end
end

create_transactions

puts "Seed Successful"