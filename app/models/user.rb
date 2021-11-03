class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: {
      admin: 0,
      writing_broker: 1,
      support: 2
    }       

    has_and_belongs_to_many :businesses

    #  Mapping integer values to string for pundit
    after_initialize do
      if self.new_record?
        self.user_type ||= :admin
      end
    end
end