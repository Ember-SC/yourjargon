class MembershipSerializer < ApplicationSerializer
  attributes :id, :is_owner, :can_modify, :organization_id, :user_id

end