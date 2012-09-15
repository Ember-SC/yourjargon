class OrganizationSerializer < ApplicationSerializer
  attributes :id, :name, :is_public
  has_many :memberships
  has_many :terms
end