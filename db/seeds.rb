# Create admin user
FactoryGirl.create(:user, :admin)

# Create generic user
@user = FactoryGirl.create(:user, email: "jmannonpdx@gmail.com")

def html_description
  "<p><span style=\"font-size: 30px;\"><strong>Overview:</strong></span></p><p>Quia voluptates quae harum qui. Tenetur possimus nulla quibusdam delectus earum. Saepe voluptatem et odit quod. Magnam ipsa repudiandae cm. Quia voluptates quae harum qui. Tenetur possimus nulla quibusdam delectus earum. Saepe voluptatem et odit quod. Magnam ipsa repudiandae cm. Quia voluptates quae harum qui. Tenetur possimus nulla quibusdam delectus earum. Saepe voluptatem et odit quod. Magnam ipsa repudiandae cm.</p><p><span style=\"font-size: 30px;\"><strong>Requirements:</strong></span></p><p><span style=\"font-size: 14px;\"><strong>&nbsp;&nbsp;</strong>* <span style=\"font-family: Arial,Helvetica,sans-serif;\">Testing</span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: Arial,Helvetica,sans-serif;\">&nbsp; * Testing</span></span></p><p><span style=\"font-size: 14px;\"><strong>&nbsp;&nbsp;</strong>* <span style=\"font-family: Arial,Helvetica,sans-serif;\">Testing</span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: Arial,Helvetica,sans-serif;\">&nbsp; * Testing</span></span></p><p><span style=\"font-size: 30px;\"><strong>Benifits:</strong></span></p><p>Quia voluptates quae harum qui. Tenetur possimus nulla quibusdam delectus earum. Saepe voluptatem et odit quod. Magnam ipsa repudiandae cm. Quia voluptates quae harum qui. Tenetur possimus</p>"
end

# Create programming postings
FactoryGirl.create(:posting, :programming, description: html_description, user: @user, expired: false)
FactoryGirl.create(:posting, :programming, description: html_description, user: @user, expires_at: 31.days.ago, expired: true)
FactoryGirl.create(:posting, :programming, description: html_description, user: @user, expires_at: 50.days.from_now, expired: false)
FactoryGirl.create(:posting, :programming, description: html_description, user: @user, expired: false)
FactoryGirl.create(:posting, :programming, description: html_description, user: @user, expired: false)

# Create marketing postings
FactoryGirl.create(:posting, :marketing, description: html_description, user: @user, expired: false)
FactoryGirl.create(:posting, :marketing, description: html_description, user: @user, expires_at: 31.days.ago, expired: true)
FactoryGirl.create(:posting, :marketing, description: html_description, user: @user, expires_at: 50.days.from_now, expired: false)
FactoryGirl.create(:posting, :marketing, description: html_description, user: @user, expires_at: 35.days.from_now, expired: false)

# Create design postings
FactoryGirl.create(:posting, :design, description: html_description, user: @user, expired: false)
FactoryGirl.create(:posting, :design, description: html_description, user: @user, expires_at: 31.days.ago, expired: true)
FactoryGirl.create(:posting, :design, description: html_description, user: @user, expires_at: 50.days.from_now, expired: false)
FactoryGirl.create(:posting, :design, description: html_description, user: @user, expires_at: 40.days.from_now, expired: false)

# Create devops postings
FactoryGirl.create(:posting, :devops, description: html_description, user: @user, expired: false)
FactoryGirl.create(:posting, :devops, description: html_description, user: @user, expired: false)
FactoryGirl.create(:posting, :devops, description: html_description, user: @user, expires_at: 31.days.ago, expired: true)
FactoryGirl.create(:posting, :devops, description: html_description, user: @user, expires_at: 50.days.from_now, expired: false)
FactoryGirl.create(:posting, :devops, description: html_description, user: @user, expires_at: 50.days.from_now, expired: false)

# Create customer_support postings
FactoryGirl.create(:posting, :customer_support, description: html_description, user: @user)
FactoryGirl.create(:posting, :customer_support, description: html_description, user: @user, expires_at: 31.days.ago, expired: true)
FactoryGirl.create(:posting, :customer_support, description: html_description, user: @user, expires_at: 50.days.from_now)

def create_transactions
  Posting.all.each do |p|
    Transaction.create(posting: p, user: @user, transaction_id: 'test', status: 'paid', amount: BigDecimal.new('150'))
  end
end

create_transactions

puts "Seed Successful"