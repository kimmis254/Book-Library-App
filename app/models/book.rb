class Book < ApplicationRecord
  has_many :borrowings, dependent: :destroy

  validates :title, :author, presence: true
  validates :status, inclusion: { in: %w[available borrowed], message: "must be 'available' or 'borrowed'" }
end
