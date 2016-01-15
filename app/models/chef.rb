class Chef < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
end
