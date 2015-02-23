class Restaurant < ActiveRecord::Base
  has_many :reviews
  validates :name, :address, :state, :zip_code, :city, presence: true
end
