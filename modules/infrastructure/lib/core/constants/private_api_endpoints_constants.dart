class PrivateApiEndpointsConstants {
  static const String getPoint = "point/get?customerDocument={0}";
  static const String getPending = "purchase/getPending?customerDocument={0}";
  static const String getHistory = "purchase/getHistory?customerDocument={0}";
  static const String finishPurchase = "purchase/accept?purchaseId={0}&accept={1}";
  static const String getAllShops = "shop/getEnabled";
  static const String getShopById = "shop/getById?id={0}";
  static const String fetchUser = "customer/get?email={0}";
  static const String registerFirebaseToken = "notification/registerToken?document={0}&token={1}";
  static const String changePassword = "authentication/changePassword?email={0}&oldPassword={1}&newPassword={2}";
}