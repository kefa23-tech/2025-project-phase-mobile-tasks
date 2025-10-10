Product ViewSingleProduct(List<Product> Market) {
  var products = Map<String, List<String>>();
  for (Product product in Market) {
    products[product.name] = [product.description, product.price];
  }
  print("Which product would you like to view ?\n");
  String? searchFor;
  searchFor = stdin.readLineSync();
  if (products.containsKey(searchFor)) {
    print(
      "Product :  $searchFor\nDescription: ${products[searchFor][0]}\nPrice: ${products[searchfor][1]}",
    );
  } else {
    print("Sorry!! Product $searchFor is not found in our market!!");
  }
}