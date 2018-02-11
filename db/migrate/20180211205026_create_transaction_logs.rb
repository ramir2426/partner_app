class CreateTransactionLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_logs do |t|
      t.float :amount
      t.integer :type
      t.references :user, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
