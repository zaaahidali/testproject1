class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: {
      admin: 10,
      writing_broker: 20,
      support: 30
    }       

    has_and_belongs_to_many :businesses
end