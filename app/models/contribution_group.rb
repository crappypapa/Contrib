class ContributionGroup < ApplicationRecord
  belongs_to :contribution
  belongs_to :group
end
