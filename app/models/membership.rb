class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  has_one :owner, class_name: "Membership"


end