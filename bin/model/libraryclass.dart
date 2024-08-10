import 'dart:io';
import 'dart:math';
import 'data.dart';
import 'library.dart';

class LibraryClass {
  final Map<String, List<Map<String, dynamic>>> allUserReceipts = {};
  final List<LibraryData> library = [];

// to show all the availabel recept
  void allUsersRecept() {
    if (allUserReceipts.isEmpty) {
      print("There is no resepts yet");
    }
    allUserReceipts.forEach((userID, receipts) {
      print("Receipts for: $userID");
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

//buy book from the availabel list 
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

    // Calculate total 
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


//The recept display function
  void receiptDisplay(String userID) {
    double total = 0;
    if (!allUserReceipts.containsKey(userID) ||
        allUserReceipts[userID]!.isEmpty) {
      print("You did not buy anything yet. Try to buy one of the books.");
    } else {
      var receipts = allUserReceipts[userID]!;
      for (var element in receipts) {
        
        print("----> Receipt for purchase <----");
        print("Book Title:${element["title"]}");
        print("Quantity:${element["quantity"]}");
        print("Total Price:${element["totalPrice"]}");
        print("Date of purchase:${element["date"]}");
        print("--------------------------------");
        total += element["totalPrice"];
      }
      print("The Total is $total");
    }
  }

//function to display all the data set information
  void displayAll() {
    for (var element in library) {
      print("Book Id:${element.id}");
      print("Book Title:${element.title}");
      print("Book Authors:${element.authors}");
      print("Book Categories:${element.categories}");
      print("Book Year:${element.year}");
      print("Book Price:${element.price}");
      print("Book Quantity:${element.quantity}");
      print("-------------------------");
    }
  }

//function to remove book from the data set
  void removeBooks( ) {
    print("List of the books title and id to choose");
    for (var element in library) {
      print("Book Id:${element.id} ----- ${element.title}");
    }
    print("Please enter the id of the book you want to delete");
    String bookToDelet = stdin.readLineSync()!;
    // Check if the book exists
    final bookExists = library.any((element) => element.id == bookToDelet);

    if (bookExists) {
      library.removeWhere((element) => element.id == bookToDelet);
      print("Book with ID $bookToDelet has been deleted.");

      // Also remove from the original dataSet if required
      dataSet['library'] = library.map((book) => book.toJson()).toList();
    } else {
      print("Book with ID $bookToDelet not found.");
    }
  }

//function to add new book
  void addBook([LibraryData? book]) {
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

      print(
          "Enter the authors of the book (if more than one please use space or -,):");
      List<String> authors = stdin.readLineSync()!.split(',');

      print(
          "Enter the categories of the book (if more than one please use space or -,):");
      List<String> categories = stdin.readLineSync()!.split(',');

      int year = 0;
      int quantity = 0;
      double price = 0;
      try {
        print("Enter the year of publication:");
        year = int.parse(stdin.readLineSync()!);
        print("Enter the quantity:");
        quantity = int.parse(stdin.readLineSync()!);
        print("Enter the price:");
        price = double.parse(stdin.readLineSync()!);
      } catch (e) {
        print("Error,try again and enter a valid input");
      }

      book = LibraryData(
        id: id,
        title: title,
        authors: authors.map((author) => author.trim()).toList(),
        categories: categories.map((category) => category.trim()).toList(),
        year: year,
        quantity: quantity,
        price: price,
      );
      library.add(book);
      print("----> Book added successfully <----");
    }
  }

//from json to update the data set
  void coursesFromJson(Map<String, dynamic> jsonData) {
    final courseList = jsonData['library'] as List;
    library
        .addAll(courseList.map((json) => LibraryData.fromJson(json)).toList());
  }
}
