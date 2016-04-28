class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales

  # Product must have a name, but the name may not necessarily be unique
  validates :name, presence: true

end
