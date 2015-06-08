class Article < ActiveRecord::Base
	belongs_to :magazine
	has_many :comments,:dependent => :destroy
	accepts_nested_attributes_for :comments
end
