class Term < ActiveRecord::Base
  belongs_to :organization
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :organization_id
  has_paper_trail
end
