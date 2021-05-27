class Group < ApplicationRecord

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }

  belongs_to :author, class_name: 'User'
  has_many :contribution_groups
  has_many :contributions, through: :contribution_groups

end