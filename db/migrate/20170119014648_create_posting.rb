class CreatePosting < ActiveRecord::Migration[5.0]
  def change
    create_table :postings do |t|
      t.column :user_id, :int, required: true, index: true
      t.column :description, :text, required: true
      t.column :title, :string, required: true
      t.column :kind, :integer, default: 0, required: true
      t.column :company_name, :string, required: true
      t.column :company_location, :string, required: true
      t.column :application_instructions, :text, required: true
      
      t.timestamps null: false
    end
  end
end
