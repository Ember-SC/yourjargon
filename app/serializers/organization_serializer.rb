class OrganizationSerializer < ApplicationSerializer
  embed :ids
  attributes :id, :name, :owner_id
  has_many :memberships
  has_many :terms

  def owner_id
  	object.owner.id
  end
end