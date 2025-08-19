class PublicApiEndpointsConstants {
  static const String registerUser = "customer/create?password={0}";
  static const String loginUser =
      "authentication/login?email={0}&password={1}&origin={2}";
  static const String departments =
      "https://raw.githubusercontent.com/marcovega/colombia-json/master/colombia.min.json";
  static const String restorePassword =
      "authentication/restorePassword?document={0}";
  static const String refreshToken = '';    

  static const List<String> all = [
    registerUser,
    loginUser,
    departments,
    restorePassword,
    refreshToken,
  ];
}
