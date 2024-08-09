import "dart:math";

import "model/library.dart";
import "model/data.dart";
import 'dart:io';

void main() {
  // Library libraryObject = Library.fromJson(dataSet);

  var books = LibraryClass();
  books.coursesFromJson(dataSet);

  books.displayAll();
  print(
      "------------------------ adding course ----------------------------------");

  books.addCourse();

  books.displayAll();

  print("Please enter the id of the book you want to delet");
  int bookToDelet = int.parse(stdin.readLineSync()!);
  books.removeBooks(bookToDelet);
}

class LibraryClass {
  final List<LibraryData> library = [];

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

  void removeBooks(int bookToDelet) {
    library.removeWhere((element) => element.id == bookToDelet);
    print("$bookToDelet is deleted");
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
    print("Course added");
  }

  void coursesFromJson(Map<String, dynamic> jsonData) {
    final courseList = jsonData['library'] as List;
    library
        .addAll(courseList.map((json) => LibraryData.fromJson(json)).toList());
  }
}
