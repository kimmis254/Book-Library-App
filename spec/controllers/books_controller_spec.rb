require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let!(:book) { Book.create(title: "Test Book", author: "John Doe", status: "available") }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new book" do
      expect {
        post :create, params: { book: { title: "New Book", author: "Jane Doe", status: "available" } }
      }.to change(Book, :count).by(1)

      expect(response).to redirect_to(books_path)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the book" do
      expect {
        delete :destroy, params: { id: book.id }
      }.to change(Book, :count).by(-1)

      expect(response).to redirect_to(books_path)
    end
  end
end
