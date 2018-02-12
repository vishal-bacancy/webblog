class Blog < ApplicationRecord
resourcify
belongs_to :user
has_many :comments





end
