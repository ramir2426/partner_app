class TransactionLog < ApplicationRecord
  belongs_to :user
  enum status: [:Paid, :Unpaid]
  enum type: [:Profit, :loss]
end
