class Group < ApplicationRecord
  has_many :messages
  validates :name, presence: true
  scope :search, -> (name) {where("name like ?", "%#{name}%")}
end
