class Borrowing < ApplicationRecord
  belongs_to :book

  validates :borrower_name, presence: true
  validate :return_date_after_borrow_date, if: -> { returned_at.present? }

  private

  def return_date_after_borrow_date
    if returned_at < borrowed_at
      errors.add(:returned_at, "must be after the borrowed date")
    end
  end
end
