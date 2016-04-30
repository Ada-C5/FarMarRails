class Market < ActiveRecord::Base
  has_many :vendors
  validates :name, presence: true, uniqueness: true, length: { in: 1..30 }
  validates :address, presence: true, uniqueness: true, length: { in: 1..50 }
  validates :city, presence: true, length: { in: 1..50 }
  validates :county, presence: true, length: { in: 1..50 }
  validates :state, presence: true, length: { in: 1..20 }
  validates :zip, presence: true,  numericality: { only_integer: true }
end
