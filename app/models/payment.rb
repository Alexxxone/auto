class Payment < ActiveRecord::Base
  belongs_to :customer, :counter_cache => true
  belongs_to :user
  before_save :count_data


  def count_data
    if self.customer.payments_count == 7
      self.customer.update_attributes(payments_count: 0)
    end
  end
end
