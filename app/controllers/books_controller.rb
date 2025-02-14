class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy borrow return]

  def index
    @books = Book.all
  end

  def show
    @borrowings = @book.borrowings.order(borrowed_at: :desc)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.status = 'available'
    if @book.save
      redirect_to books_path, notice: "Book added successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])

    if @book.destroy
      redirect_to books_path, notice: "Book was successfully deleted."
    else
      redirect_to books_path, alert: "Failed to delete the book."
    end
  end




  def borrow
    if @book.status == 'available'
      @book.update(status: 'borrowed')
      Borrowing.create(book: @book, borrower_name: params[:borrower_name], borrowed_at: Time.current)
      redirect_to @book, notice: "Book borrowed successfully."
    else
      redirect_to @book, alert: "Book is already borrowed."
    end
  end

  def return
    if @book.status == 'borrowed'
      borrowing = @book.borrowings.last
      borrowing.update(returned_at: Time.current)
      @book.update(status: 'available')
      redirect_to @book, notice: "Book returned successfully."
    else
      redirect_to @book, alert: "Book is not borrowed."
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
