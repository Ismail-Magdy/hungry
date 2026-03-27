class ApiEndPoints {
  /// Profile
  static const String getProfileData = "profile";
  static const String updateProfile = "update-profile";

  /// Auth
  static const String register = "register";
  static const String login = "login";
  static const String logout = "logout";

  /// GET
  static const String getAllCategories = "categories";
  static const String getAllProducts = "products";
  static const String getProductById = "products/2";
  static const String getUserFavorites = "favorites";

  /// POST
  static const String addOrRemoveFromFavorite = "toggle-favorite";
}
