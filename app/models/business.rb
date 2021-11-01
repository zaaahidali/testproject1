class Business < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :tasks, dependent: :destroy
end
