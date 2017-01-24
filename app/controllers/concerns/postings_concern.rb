module PostingsConcern

  def self.grouped_postings
    hash = {}
    Posting.kinds.keys.each do |kind|
      hash[kind] = Posting.active.where(kind: kind)
    end
    
    hash
  end

end