import "dart:math";

import "model/library.dart";
import "model/data.dart";
import 'dart:io';

final Map<String, List<Map<String, dynamic>>> allUserReceipts = {};
void main() {
  var books = LibraryClass();
  books.coursesFromJson(dataSet);
  // Library libraryObject = Library.fromJson(dataSet);
  while (true) {
    print("welcome");
    print("who is using the program");
    print("1-Admin      2-Customer");
    int user = int.parse(stdin.readLineSync()!);

    if (user == 1) {
      while (true) {
        print("1-Display the library information");
        print("2-Add new book to the library");
        print("3-Remove book from the library");
        print("4-View all receipt");
        print("5-Exit");
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
          case 4:
            books.allUsersRecept();
          case 5:
            break;
          default:
            print("Please enter a valid input");
        }
        if (input == 5) {
          break;
        }
      }
    } else if (user == 2) {
      print("Please enter your name");
      String userName = stdin.readLineSync()!;
      String userID = generateUserID(userName);

      while (true) {
        print("1-Display the library information");
        print("2-Buy book from the library");
        print("3-view the view the receipt for purchase");
        print("4-Exit");
        int input = int.parse(stdin.readLineSync()!);

        switch (input) {
          case 1:
            books.displayAll();
          case 2:
            books.buyBook(userID);
          case 3:
            books.receiptDisplay(userID);
          case 4:
            break;
          default:
            print("Please enter a correct number");
        }
        if (input == 4) {
          break;
        }
      }
    }
  }
}

String generateUserID(String userName) {
  final randomId = Random();
  return "$userName-${randomId.nextInt(9999)}";
}

class LibraryClass {
  final List<LibraryData> library = [];
  final List<Map<String, dynamic>> receipt = [];
  final List<Map<String, dynamic>> allRecept = [];

  void allUsersRecept() {
    if (allRecept.isEmpty) {
      print("there is no resepts yet");
    }
    allUserReceipts.forEach((userID, receipts) {
      print("Receipts for user: $userID");
      for (var i = 0; i < receipts.length; i++) {
        var receipt = receipts[i];
        print("Receipt ${i + 1}:");
        print("Title: ${receipt['title']}");
        print("Quantity: ${receipt['quantity']}");
        print("Total Price: \$${receipt['totalPrice']}");
        print("Date: ${receipt['date']}");
        print("-------------------------");
      }
    });
  }

  void buyBook(String userID) {
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
    var currentReceipt = {
      "title": book.title,
      "quantity": quantityToBuy,
      "totalPrice": totalPrice,
      "date": DateTime.now(),
    };

    if (!allUserReceipts.containsKey(userID)) {
      allUserReceipts[userID] = [];
    }
    allUserReceipts[userID]!.add(currentReceipt);

    print(
        "You have successfully purchased $quantityToBuy copies of '${book.title}' for \$${totalPrice.toStringAsFixed(2)}.");

    // Update the original dataSet
    dataSet['library'] = library.map((book) => book.toJson()).toList();
  }

  void receiptDisplay(String userID) {
    double total = 0;
    if (!allUserReceipts.containsKey(userID) ||
        allUserReceipts[userID]!.isEmpty) {
      print("You did not buy anything yet. Try to buy one of the books.");
    } else {
      var receipts = allUserReceipts[userID]!;
      for (var element in receipts) {
        print(element["title"]);
        print(element["quantity"]);
        print(element["totalPrice"]);
        print(element["date"]);
        total += element["totalPrice"];
      }
      print("the total is $total");
    }
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

  void removeBooks(String bookToDelete) {
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
