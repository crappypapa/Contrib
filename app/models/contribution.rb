class Contribution < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :contribution_groups
  has_many :groups, through: :contribution_groups

  validates :amount, presence: true , numericality: { greater_than: 0 }
  validates :name, presence: true, length: {minimum: 3, maximum: 30}
  
  scope :ordered_desc, -> { includes(:author).order('created_at DESC') }

end