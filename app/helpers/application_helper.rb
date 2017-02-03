module ApplicationHelper
  
  # adds new-posting class to new postings
  def new_posting?(posting)
    if posting.new?
      html = "<span class='badge'>NEW!</span>"
      html.html_safe
    end
  end
  
end
