require 'rails_helper'

RSpec.describe ContributionGroup, type: :model do
  describe 'associations' do
    it { should belong_to(:contribution) }
    it { should belong_to(:group) }
    it { should_not belong_to(:user) }
  end
end
