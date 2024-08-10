import "dart:math";

import "model/library.dart";
import "model/data.dart";
import 'dart:io';

void main() {
  var books = LibraryClass();
  books.coursesFromJson(dataSet);
  // Library libraryObject = Library.fromJson(dataSet);
  print("welcome");
  print("who is using the program");
  print("1-Admin      2-Customer");
  int user = int.parse(stdin.readLineSync()!);

  while (true) {
    if (user == 1) {
      print("1-Display the library information");
      print("2-Add new book to the library");
      print("3-Remove book from the library");
      print("4-View all receipt");
      int input = int.parse(stdin.readLineSync()!);
      switch (input) {
        case 1:
          books.displayAll();

        case 2:
          print(
              "--------------------- adding course --------------------------");
          books.addCourse();

        case 3:
          print(
              "--------------------- Removing course ------------------------------");
          print("Please enter the id of the book you want to delet");
          String bookToDelet = stdin.readLineSync()!;
          books.removeBooks(bookToDelet);
      }
    } else if (user == 2) {
      print("1-Display the library information");
      print("2-Buy book from the library");
      print("3-view the view the receipt for purchase");
      int input = int.parse(stdin.readLineSync()!);

      switch (input) {
        case 1:
          books.displayAll();
        case 2:
          books.buyBook();

        default:
          print("Please enter a correct number");
      }
    }
  }
}

class LibraryClass {
  final List<LibraryData> library = [];
  final List<Map<String, dynamic>> receipt = [];

  void buyBook() {
    displayAll(); // Show all available books
    print("Enter the ID of the book you want to buy:");
    String bookId = stdin.readLineSync()!;
    LibraryData book;

    try {
      // Find the book by ID
      book = library.firstWhere((element) => element.id == bookId);
    } catch (e) {
      print("Book not found.");
      return;
    }

    if (book.quantity == 0) {
      print("Sorry, this book is out of stock.");
      return;
    }

    print("How many copies would you like to buy?");
    int quantityToBuy = int.parse(stdin.readLineSync()!);

    if (quantityToBuy > book.quantity) {
      print("Not enough stock available. Only ${book.quantity} copies left.");
      return;
    }

    // Update the book's quantity
    book.quantity -= quantityToBuy;

    // Calculate total price
    double totalPrice = quantityToBuy * book.price;

    // Store the receipt information
    receipt.add({
      "title": book.title,
      "quantity": quantityToBuy,
      "totalPrice": totalPrice,
      "date": DateTime.now(),
    });

    print(
        "You have successfully purchased $quantityToBuy copies of '${book.title}' for \$${totalPrice.toStringAsFixed(2)}.");

    // Update the original dataSet
    dataSet['library'] = library.map((book) => book.toJson()).toList();
  }

  void displayAll() {
    for (var element in library) {
      print(element.id);
      print(element.title);
      print(element.authors);
      print(element.categories);
      print(element.year);
      print(element.price);
      print(element.quantity);
      print("-------------------------");
    }
  }

  // void removeBooks(int bookToDelet) {
  //   library.removeWhere((element) => element.id == bookToDelet);
  //   print("$bookToDelet is deleted");
  // }

  void removeBooks(bookToDelete) {
    // Check if the book with the given ID exists
    final bookExists = library.any((element) => element.id == bookToDelete);

    if (bookExists) {
      library.removeWhere((element) => element.id == bookToDelete);
      print("Book with ID $bookToDelete has been deleted.");

      // Also remove from the original dataSet if required
      dataSet['library'] = library.map((book) => book.toJson()).toList();
    } else {
      print("Book with ID $bookToDelete not found.");
    }
  }

  void addCourse([LibraryData? book]) {
    if (book == null) {
      // Generate a unique ID directly within the addCourse method
      final random = Random();
      String id;
      bool idExists;
      do {
        id = random
            .nextInt(100000)
            .toString()
            .padLeft(4, '0'); // Generate a random 5-digit ID
        idExists = library
            .any((book) => book.id == id); // Check if the ID already exists
      } while (idExists);

      print("Enter the book title:");
      String title = stdin.readLineSync()!;

      print("Enter the authors use separat (author-author):");
      List<String> authors = stdin.readLineSync()!.split(',');

      print("Enter the categories use separated (categorie-categorie):");
      List<String> categories = stdin.readLineSync()!.split(',');

      print("Enter the year of publication:");
      int year = int.parse(stdin.readLineSync()!);

      print("Enter the quantity:");
      int quantity = int.parse(stdin.readLineSync()!);

      print("Enter the price:");
      double price = double.parse(stdin.readLineSync()!);

      book = LibraryData(
        id: id,
        title: title,
        authors: authors.map((author) => author.trim()).toList(),
        categories: categories.map((category) => category.trim()).toList(),
        year: year,
        quantity: quantity,
        price: price,
      );
    }

    library.add(book);
    print("book added");
  }

  void coursesFromJson(Map<String, dynamic> jsonData) {
    final courseList = jsonData['library'] as List;
    library
        .addAll(courseList.map((json) => LibraryData.fromJson(json)).toList());
  }
}
