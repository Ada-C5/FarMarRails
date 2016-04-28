class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  # Vendor must have a name, but the name may not necessarily be unique
  validates :name, presence: true

  # must have number of employees as integer
  validates :no_employees, numericality: { only_integer: true }

end
