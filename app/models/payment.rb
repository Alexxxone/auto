class Payment < ActiveRecord::Base
  belongs_to :customer, :counter_cache => true
  belongs_to :user
  validates :amount, presence: true
  validates :customer_id, presence: true
  validates :description, presence: true, length: { in: 6..220 }
end
