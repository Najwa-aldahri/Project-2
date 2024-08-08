# Library System Project 📚

Welcome to the Library System Project! This project involves creating a command-line application in Dart to manage a library. The system will allow users to perform various operations based on their role: Admin or Customer.

## Project Overview

You will develop a Library System that can perform the following operations:

- **Add a Book**: Add new books to the library.
- **Remove a Book**: Remove books from the library.
- **Buy a Book**: Purchase a book if it's available.
- **Display Receipt**: Show a receipt for the purchase.

## JSON Data Structure
The library data is stored in a JSON format with the following structure:
```
{
  "library": [
    {
      "id": "1",
      "title": "The Great Gatsby",
      "authors": ["F. Scott Fitzgerald"],
      "categories": ["Fiction"],
      "year": 1925,
      "quantity": 5,
      "price": 10.99
    },
    {
      "id": "2",
      "title": "To Kill a Mockingbird",
      "authors": ["Harper Lee"],
      "categories": ["Fiction", "Classic"],
      "year": 1960,
      "quantity": 0,
      "price": 12.99
    },
    {
      "id": "3",
      "title": "1984",
      "authors": ["George Orwell"],
      "categories": ["Dystopian", "Science Fiction"],
      "year": 1949,
      "quantity": 3,
      "price": 15.49
    },
    {
      "id": "4",
      "title": "Pride and Prejudice",
      "authors": ["Jane Austen"],
      "categories": ["Romance", "Classic"],
      "year": 1813,
      "quantity": 4,
      "price": 8.99
    },
    {
      "id": "5",
      "title": "The Catcher in the Rye",
      "authors": ["J.D. Salinger"],
      "categories": ["Fiction"],
      "year": 1951,
      "quantity": 2,
      "price": 13.49
    }
  ]
}

```
## Attributes

- **id**: Unique identifier for the book.
- **title**: Title of the book.
- **authors**: List of authors.
- **categories**: List of categories.
- **year**: Year of publication.
- **quantity**: Number of copies available.

## User Roles

### Admin

- Can add or remove books.
- Can view the receipt for purchases.

### Customer

- Can buy books if they are available.
- Can view the receipt for their purchase.

## Instructions

### Set Up the Project

1. Create a Dart command-line application.
2. Use the provided JSON data to initialize your library.

### Implement Operations

- **Add a Book**: Write a function to add new books to the library.
- **Remove a Book**: Implement a function to remove books from the library.
- **Buy a Book**: Create a function to handle book purchases. Ensure the book is available before completing the purchase.
- **Display Receipt**: Develop a function to display a receipt for the purchased books.

### Role Management

- Implement role-based functionality to differentiate between Admin and Customer actions.

## Submission
Please submit your project by including all necessary Dart files and a brief description of how to run the application.

## Evaluation

- **Functionality**: Ensure all required functions work correctly and handle edge cases.
- **Code Quality**: Write clean, readable, and well-organized code. Use meaningful variable and function names.
- **Error Handling**: Implement proper error handling for invalid operations and edge cases.
- **User Interface**: For a command-line application, ensure that prompts and outputs are user-friendly and clear.
- **Role Enforcement**: Verify that user roles are properly enforced and only allow appropriate actions for each role.

## Deadline

Please submit your completed project by **Sunday, August 11, 2024, at 9:59 AM**.

