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
   git clone https://github.com/kevykibbz/book-lending-lsystem.git
   cd book-lending-lsystem
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

To deploy on **Render**, follow these steps:

### 1. Create a Render Account
Sign up at [Render](https://render.com/) if you haven't already.

### 2. Add the Repository
- Go to the [Render Dashboard](https://dashboard.render.com/).
- Click **New Web Service**.
- Connect your GitHub repository.

### 3. Configure the Service
- Choose the **Ruby** runtime.
- Set the build command:  
  ```sh
  ./bin/render-build.sh
  ```
### 4. Set the Start Command
```bash
bundle exec rails server
```
### 5. Set Environment Variables
- **DATABASE_URL**: Linked to the database in Render.
- **RAILS_MASTER_KEY**: Copy from config/master.key.

### 6. Database Setup
- Add a PostgreSQL database under Render Databases.
- Use the database connection string for DATABASE_URL.

### 7. Trigger the First Deployment
- Click Deploy.
After deployment, manually run:
```bash
bundle exec rails db:migrate
```
Your Rails app should now be live on Render! 🚀


## Live Application  
Visit the live application here: [Book Lending System](https://book-lending-system-webservice.onrender.com/)


## Repository
[GitHub Repository](https://github.com/kevykibbz/book-lending-lsystem)

---

🚀 **Happy Coding!**
