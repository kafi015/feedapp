
class Urls {
  static String baseUrl = "https://mobileappbackend.onrender.com";
  static String productInfoUrl = "$baseUrl/productInfo";
  static String customerInfoUrl = "$baseUrl/customerInfo";
  static String userInfoUrl = "$baseUrl/appUsers";

  static String changeProductPrice(String productId) =>
      '$baseUrl/updateProduct/$productId';

  static String updateCustomerInfo(String customerId) =>
      '$baseUrl/singleDetails/$customerId';

  static String updateUserPassInfo(String id) =>
      '$baseUrl/singleUser/$id';

}