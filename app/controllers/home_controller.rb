class HomeController < ApplicationController
  
  def index
    @postings = ::PostingsConcern.grouped_postings
  end
  
end