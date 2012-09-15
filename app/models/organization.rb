class Organization < ActiveRecord::Base
  has_many :memberships
  has_many :terms

end