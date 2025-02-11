# Book Lending Library

A simple Book Lending Library application built using **Ruby on Rails 8**.

## Features

### 1. Authentication
- Users can register and log in using Rails' built-in authentication.

### 2. Book Management
- Users can view a list of all books.
- Each book has a title, author, and ISBN.
- Displays availability status (available or borrowed).

### 3. Borrowing System
- Users can borrow books if available.
- Creates a borrowing record linking the user and book.
- Sets a due date (2 weeks from borrowing date).
- Prevents borrowing if the book is already borrowed.

### 4. User Profile
- Displays a list of currently borrowed books.
- Provides an option to return borrowed books.

### 5. Validations & Error Handling
- Ensures title, author, and ISBN are present.
- ISBN must be unique.
- Prevents borrowing of already borrowed books.

### 6. Testing & Code Quality
- Model tests for validations and relationships.
- Controller tests for borrowing and returning logic.
- View tests to ensure correct UI elements appear.
 
 ![Test Results](/public/test.png)

## Setup Instructions

### Prerequisites
Ensure you have the following installed:
- Ruby 3.x
- Rails 8.x
- SQLite (or another database if preferred)

### Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/book_library_app.git
   cd book_library_app
   ```
2. Install dependencies:
   ```sh
   bundle install
   ```
3. Set up the database:
   ```sh
   rails db:create db:migrate db:seed
   ```

## Running the Application

To start the Rails server:
```sh
rails server
```
Visit [http://localhost:3000](http://localhost:3000) in your browser.

## Running Tests

To run all tests:
```sh
rails test
```

To run a specific test:
```sh
rails test test/controllers/borrowings_controller_test.rb
```

## Deployment

To deploy on **Heroku**:
1. Install Heroku CLI and log in:
   ```sh
   heroku login
   ```
2. Create a Heroku app:
   ```sh
   heroku create book-library-app
   ```
3. Deploy to Heroku:
   ```sh
   git push heroku main
   heroku run rails db:migrate
   ```

## Repository
[GitHub Repository](https://github.com/kevykibbz/book-lending-lsystem)

---

🚀 **Happy Coding!**
