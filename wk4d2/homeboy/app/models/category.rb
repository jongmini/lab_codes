class Category < ActiveRecord::Base
	has_many :inventories
	has_many :products, through: :inventories
end
