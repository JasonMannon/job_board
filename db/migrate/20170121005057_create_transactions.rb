class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.column :posting_id, :int, required: true
      t.column :user_id, :int, required: true
      t.column :transaction_id, :string, required: true
      t.column :status, :string, required: true
      t.column :amount, :decimal, required: true      
    end
  end
end