class Organization < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :terms
  validates_uniqueness_of :name

end
