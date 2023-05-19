
class Urls {
  static String baseUrl = "https://mobileappbackend.onrender.com";
  static String productInfoUrl = "$baseUrl/productInfo";

  static String changeProductPrice(String productId) =>
      '$baseUrl/updateProduct/$productId';

}