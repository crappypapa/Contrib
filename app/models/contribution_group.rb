class ContributionGroup < ApplicationRecord
  belongs_to :group
  belongs_to :contribution
end