class Term < ActiveRecord::Base
  belongs_to :organization
  has_paper_trail
end
