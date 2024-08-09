
class Library {
  late final List<LibraryData> library;

  Library({
    required this.library,
  });

  factory Library.fromJson(Map<String, dynamic> json) {
    var libraryList = json["library"] as List;
    List<LibraryData> library =
        libraryList.map((e) => LibraryData.fromJson(e)).toList();
    return Library(library: library);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['library'] = library.map((e) => e.toJson()).toList();
    return data;
  }
}

class LibraryData {
  late final String id;
  late final String title;
  late final List<String> authors;
  late final List<String> categories;
  late final int year;
  late final int quantity;
  late final double price;

  LibraryData({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.year,
    required this.quantity,
    required this.price,
  });

  LibraryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    authors = List.from(json['authors']);
    categories = List.from(json['categories']);
    year = json['year'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['authors'] = authors;
    data['categories'] = categories;
    data['year'] = year;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}
