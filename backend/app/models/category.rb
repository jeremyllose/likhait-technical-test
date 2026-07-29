class Category < ApplicationRecord
  has_many :expenses, dependent: :destroy

  # Category name must be present and unique (case-insensitive)
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
