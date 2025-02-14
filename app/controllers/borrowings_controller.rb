class BorrowingsController < ApplicationController
  def history
    @borrower_name = params[:borrower_name]
    @borrowings = Borrowing.includes(:book).where(borrower_name: @borrower_name)

    if @borrowings.exists?
      render :history
    else
      redirect_to books_path, alert: "No records found for borrower: #{@borrower_name}"
    end
  end


end
