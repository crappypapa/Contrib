class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :contribution_groups
  has_many :contributions, through: :contribution_groups
  has_one_attached :image

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :image, presence: true

  scope :asc, -> { order('name ASC') }
end
