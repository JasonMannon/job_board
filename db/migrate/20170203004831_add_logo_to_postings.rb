class AddLogoToPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :postings, :logo, :string
  end
end
