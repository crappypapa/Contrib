class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, foreign_key: :author_id
  has_many :contributions, foreign_key: :author_id, dependent: :destroy

  validates :name, :email, presence: true, length: { minimum: 3, maximum: 25 }

end
