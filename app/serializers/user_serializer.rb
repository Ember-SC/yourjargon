class UserSerializer < ApplicationSerializer
  attributes :id, :email, :name
  has_many :memberships
  
  def id
    object.api_key
  end

end