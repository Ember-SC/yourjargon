class MembershipSerializer < ApplicationSerializer
  attributes :id, :is_owner, :can_modify

end