class UserSerializer < ApplicationSerializer
  embed :ids
  attributes :id, :email, :name
  has_many :memberships

end