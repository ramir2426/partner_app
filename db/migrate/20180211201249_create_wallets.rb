class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.float :current_balance, default: 0.0
      t.float :profit, default: 0.0
      t.float :loss, default: 0.0
      t.references :user, foreign_key: true, default: 0.0

      t.timestamps
    end
  end
end
