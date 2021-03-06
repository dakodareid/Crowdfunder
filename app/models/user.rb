class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  has_many :owned_projects, class_name: "Project", foreign_key: "owner_id"

  has_many :pledges
  has_many :backed_projects, through: :pledges, source: :project

end
