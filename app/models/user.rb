class User < ApplicationRecord
  after_create :assign_role
  rolify
  acts_as_messageable
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :blogs, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
	has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

	has_many :following, through: :active_relationships, source: :followed, dependent: :delete_all                                  
	has_many :followers, through: :passive_relationships, source: :follower, dependent: :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

def assign_role

	self.add_role(:blogger)

end

def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
def mailboxer_email(object)
  #Check if an email should be sent for that object
  #if true
  #if false
  #return nil
end






end
