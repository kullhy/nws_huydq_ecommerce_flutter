class ApiPath {
  // ignore: todo
  //TODO: Implement config API path by branch
  //* Base URL
  static const String apiVersion = 'api/v1';
  static const String urlRoot = 'https://api.escuelajs.co';
  static const String baseUrl = '$urlRoot/$apiVersion';

  static const login = '/auth/login';
  static const signUp = '/users/';
  static const updateUser = '/users/';

  static const listCategories = "/categories/";
  static const profile = "/auth/profile";

  static const String getListCategory =
      "$baseUrl$listCategories?offset=0&limit=10";
  String getListProduct(int categoryId) {
    return "$baseUrl$listCategories$categoryId/products?offset=0&limit=10";
  }
}
