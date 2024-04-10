class CommonKeys {
  String uid = "uid";
  String createdAt = "createdAt";
  String updatedAt = "updatedAt";
}

CommonKeys commonKeys = CommonKeys();

class Collection {
  String user = "user";
  String server = "server";
  String portfolio = "portfolio";
}

Collection collections = Collection();

class UserKeys {
  String uid = commonKeys.uid;
  String firstName = "firstName";
  String email = "email";
  String photoUrl = "photoUrl";
  String password = "password";
  String isEmailLogin = "isEmailLogin";
  String isTester = "isTester";
  String userRole = "userRole";
  String createdAt = commonKeys.createdAt;
  String updatedAt = commonKeys.updatedAt;
  String loginType = "loginType";
}

UserKeys userKeys = UserKeys();

class ServerKey {
  String uid = commonKeys.uid;
  String name = "name";
  String flag = "flag";
  String ovpnFile = "ovpnFile";
  String userName = "userName";
  String password = "password";
  String isActive = "isActive";
  String createdAt = commonKeys.createdAt;
  String updatedAt = commonKeys.updatedAt;
}

ServerKey serverKey = ServerKey();

class EndUserKeys {
  String uid = commonKeys.uid;

  //String deviceId = "deviceId";
  String isAdmin = "isAdmin";
  String createdDate = commonKeys.createdAt;
  String updatedDate = commonKeys.updatedAt;
}

EndUserKeys endUserKey = EndUserKeys();

class PortfolioKeys {
  String uid = commonKeys.uid;
  String name = "name";
  String coinId = "coinId";
  String date = "date";
  String noOfUnits = "noOfUnits";
  String coinIcon = "coinIcon";
  String coinSymbol = "coinSymbol";
  String price = "price";
  String perCoin = "perCoin";
  String buyInCurrency = "buyInCurrency";
  String notes = "notes";
  String createdDate = commonKeys.createdAt;
  String updatedDate = commonKeys.updatedAt;
  String currentCurrencyList = "currentCurrencyList";
}

PortfolioKeys portfolioKey = PortfolioKeys();
