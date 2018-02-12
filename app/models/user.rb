class User < ApplicationRecord
  rolify

  has_many :blogs
  has_many :comments
  after_create :assign_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def assign_role

	self.add_role(:blogger)

end

end
