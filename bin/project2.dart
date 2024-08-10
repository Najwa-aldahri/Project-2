import "dart:math";
import "model/data.dart";
import 'dart:io';
import "model/libraryclass.dart";

void main() {
  var books = LibraryClass();
  books.coursesFromJson(dataSet);

  while (true) {
    print("\n---------------------------------------------------");
    print("--------------------- Welcome ---------------------");
    print("---------------------------------------------------");

    print("Who is using the program?");
    print("1-Admin    2-Customer    3-Exit");
    int user = 0;
    //to make sure no errors happen 
    try {
      user = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print(e);
    }
    if (user == 1) {
      //to the Admin
      while (true) {
        print("\n1-Display the library information");
        print("2-Add new book to the library");
        print("3-Remove book from the library");
        print("4-View all receipt");
        print("5-Exit");
        int input = 0;
        try {
          input = int.parse(stdin.readLineSync()!);

          switch (input) {
            case 1:
              books.displayAll();

            case 2:
              print(
                  "--------------------- adding Book ------------------------");
              books.addBook();

            case 3:
              print(
                  "--------------------- Removing Book ------------------------------");

              books.removeBooks();
            case 4:
              books.allUsersRecept();
            case 5:
              break;
            default:
              print("Please enter a valid input");
          }
        } catch (e) {
          print(e);
        }
        if (input == 5) {
          break;
        }
      }
      //to the customer
    } else if (user == 2) {
      print("Please enter your name");
      String userName = stdin.readLineSync()!;
      String userID = generateUserID(userName);

      while (true) {
        print("1-Display the library information");
        print("2-Buy book from the library");
        print("3-View the receipt for purchase");
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
    } else if (user == 3) {
      print("----> Thank you for using library system <----");
      print("-----------> See you soon good bay <----------");
      exit(0);
    } //any other invalid input
    else {
      print("Enter valid input");
    }
  }
}
//to generate the user id 
String generateUserID(String userName) {
  final randomId = Random();
  return "$userName-${randomId.nextInt(9999)}";
}
