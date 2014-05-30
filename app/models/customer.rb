class Customer < ActiveRecord::Base
  has_many :payments
  belongs_to :user
  before_save :normalize_data

  def normalize_data
    self.number_code =  self.number_code.upcase.gsub(' ','')
    self.name =  self.name.capitalize
  end
end
