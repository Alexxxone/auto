class Customer < ActiveRecord::Base
  has_many :payments
  belongs_to :user
  before_save :normalize_data

  def normalize_data
    self.number_code =  self.number_code.upcase.gsub(' ','')
    self.name =  self.name.capitalize
  end


  def free_payment_left
    6-self.payments_count%7
  end

  def next_free?
   self.free_payment_left == 0 && self.payments_count != 0
  end

end
