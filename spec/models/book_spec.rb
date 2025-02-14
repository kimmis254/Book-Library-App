require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      book = Book.new(title: "Test Book", author: "John Doe", status: "available")
      expect(book).to be_valid
    end

    it "is not valid without a title" do
      book = Book.new(author: "John Doe", status: "available")
      expect(book).not_to be_valid
    end

    it "is not valid without an author" do
      book = Book.new(title: "Test Book", status: "available")
      expect(book).not_to be_valid
    end
  end

  describe "Scopes" do
    it "returns only available books" do
      available_book = Book.create!(title: "Available Book", author: "John", status: "available")
      borrowed_book = Book.create!(title: "Borrowed Book", author: "Jane", status: "borrowed")

      expect(Book.where(status: "available")).to include(available_book)
      expect(Book.where(status: "available")).not_to include(borrowed_book)
    end
  end
end


