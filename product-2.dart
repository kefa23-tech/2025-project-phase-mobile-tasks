import 'dart:io';

class Product {
  String? name, description, price;
  Product({this.name, this.description, this.price});
}

Product AddProductData(Product p) {
  print("Enter product name: ");
  p.name = stdin.readLineSync();
  print("Enter product desctription: ");
  p.description = stdin.readLineSync();
  print("Enter product price: ");
  p.price = stdin.readLineSync();
  return p;
}

void ViewAllProducts(List<Product> Market) {
  if (Market.isEmpty) {
    print("No products in the market.");
  } else {
    for (Product product in Market) {
      print("Name: ${product.name}");
      print("Description: ${product.description}");
      print("Price: ${product.price}");
    }
  }
}

void ViewSingleProduct(List<Product> Market) {
  var products = <String?, List<String?>>{};
  for (Product product in Market) {
    products[product.name] = [product.description, product.price];
  }
  print("Which product would you like to view ?\n");
  String? searchFor = stdin.readLineSync();

  if (searchFor != null && products.containsKey(searchFor)) {
    print(
      "Product :  $searchFor\nDescription: ${products[searchFor]![0]}\nPrice: ${products[searchFor]![1]}",
    );
  } else {
    print("Sorry!! Product $searchFor is not found in our market!!");
  }
}

Product editProduct(Product product) {
  print("Enter Product name: ");
  product.name = stdin.readLineSync();
  print("Enter Product description: ");
  product.description = stdin.readLineSync();
  print("Enter Product price: ");
  product.price = stdin.readLineSync();
  return product;
}

List<Product> deleteProduct(List<Product> Market) {
  print("Enter Product name to delete: ");
  String? name = stdin.readLineSync();

  if (name == null || name.isEmpty) {
    print("Invalid input.");
    return Market;
  }

  bool found = false;
  Market.removeWhere((product) {
    if (product.name?.toLowerCase() == name.toLowerCase()) {
      print("Are you sure you want to delete the product $name ? (yes/no)");
      String? confirm = stdin.readLineSync();
      if (confirm?.toLowerCase() == "yes") {
        print("Product $name deleted successfully!");
        found = true;
        return true; // remove it
      } else {
        print("Deletion cancelled.");
      }
    }
    return false;
  });

  if (!found) {
    print("Product not found!!");
  }
  return Market;
}

void main() {
  List<Product> Market = [];

  bool shopping = true;
  while (shopping) {
    print("What would you like to do ");
    print(
      "1.Add a new product\n"
      "2.View all products\n"
      "3.View a single product\n"
      "4.Edit a product\n"
      "5.Delete a product",
    );
    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        bool adding = true;
        while (adding) {
          Product p = Product();
          AddProductData(p);
          Market.add(p);
          print("Do you want to add more? (yes/no)");
          String? more = stdin.readLineSync();
          if (more?.toLowerCase() != 'yes') {
            adding = false;
          }
        }

        break;
      case '2':
        ViewAllProducts(Market);
        break;
      case '3':
        ViewSingleProduct(Market);
        break;
      case '4':
        print("Enter Product name to edit: ");
        String? name = stdin.readLineSync();
        bool found = false;
        for (Product product in Market) {
          if (product.name?.toLowerCase() == name?.toLowerCase()) {
            editProduct(product);
            found = true;
          }
        }
        if (!found) {
          print("product not found!!");
        }
        break;
      case '5':
        bool deleting = true;
        while (deleting) {
          deleteProduct(Market);
          print("do want to delete another product? (yes/no)");
          String? del = stdin.readLineSync();
          if (del != "yes") {
            deleting = false;
          }
        }
        break;
      default:
        print("Thank you for viewing us!!");
    }

    print("Do want to Exit? (yes/no)");
    String? yes = stdin.readLineSync();
    if (yes?.toLowerCase() == 'yes') {
      shopping = false;
    }
  }
}
