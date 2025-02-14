# Book Lending Library

A simple book lending library application built using **Ruby on Rails 8** that allows users to manage books (add, view, update, delete) and track their lending history. Users can borrow and return books without authentication, and the system keeps track of borrowers and their lending history.

## Features
- **Book Management**: Add, view, update, and delete books.
- **Borrow & Return Books**: Users can borrow books by entering their name and return them when done.
- **Borrowing History**: Tracks who borrowed a book, when it was borrowed, and when it was returned.
- **Borrower History**: View the lending history of a specific borrower.
- **Validation**: Ensures books have a title and author before being added.

## Technologies Used
- **Ruby on Rails 8**
- **SQLite3** (or PostgreSQL for production)
- **Bootstrap (for styling)**
- **RSpec & Capybara** (for testing)

## Installation
### Prerequisites
- Ruby (3.2 or later)
- Rails (8.0)
- Bundler
- SQLite3 or PostgreSQL

### Setup
1. **Clone the Repository**
   ```sh
   git clone https://github.com/your-username/book-library.git
   cd book-library
   ```
2. **Install Dependencies**
   ```sh
   bundle install
   ```
3. **Setup Database**
   ```sh
   bin/rails db:create db:migrate db:seed
   ```
4. **Run the Server**
   ```sh
   bin/rails server
   ```
5. **Open in Browser**
   Visit `http://localhost:3000`

## Usage
- **Manage Books**: Click **Add Book**, fill in details, and submit.
- **Borrow a Book**: Click on a book and enter your name.
- **Return a Book**: Click **Return** on a borrowed book.
- **View Borrowing History**: Check past borrowing records on the book details page.
- **View Borrower History**: Enter a borrower's name to see their borrowing history.

## Running Tests
To run model and controller tests using RSpec:
```sh
bin/rails db:migrate RAILS_ENV=test
bin/rspec
```

## API Endpoints (if applicable)
| Method | Endpoint | Description |
|--------|---------|-------------|
| GET | `/books` | List all books |
| POST | `/books` | Add a new book |
| GET | `/books/:id` | View book details |
| DELETE | `/books/:id` | Delete a book |
| POST | `/books/:id/borrow` | Borrow a book |
| POST | `/books/:id/return` | Return a book |
| GET | `/borrowings/history/:borrower_name` | View borrower's history |

## Known Issues & Future Improvements
- Implement user authentication for better tracking.
- Add pagination for large book lists.
- Improve UI/UX using a frontend framework.

## Contributing
1. Fork the repo
2. Create a feature branch (`git checkout -b feature-name`)
3. Commit changes (`git commit -m 'Add feature'`)
4. Push branch (`git push origin feature-name`)
5. Open a Pull Request

## License
This project is licensed under the MIT License.

## Contact
For any questions or issues, contact [Your Name] at [Your Email].

