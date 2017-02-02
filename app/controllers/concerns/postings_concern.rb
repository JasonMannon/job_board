module PostingsConcern

  def self.grouped_postings
    hash = {}
    Posting.kinds.keys.each do |kind|
      hash[kind] = Posting.active.where(kind: kind).order(created_at: :desc)
    end
    
    hash
  end

end