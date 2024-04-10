import 'dart:io';

import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/search_model.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CoinTableKeys {
  static String id = ' id';
  static String large = 'large';
  static String market_cap_rank = 'market_cap_rank';
  static String name = 'name';
  static String symbol = 'symbol';
  static String thumb = 'thumb';
  static String isFav = 'isFav';
}

class QueryStringForCoinTable {
  static String id = '${CoinTableKeys.id} Text';
  static String large = '${CoinTableKeys.large} Text';
  static String market_cap_rank = '${CoinTableKeys.market_cap_rank} INTEGER';
  static String name = '${CoinTableKeys.name} Text';
  static String symbol = '${CoinTableKeys.symbol} Text';
  static String thumb = '${CoinTableKeys.thumb} Text';
  static String isFav = '${CoinTableKeys.isFav} BOOLEAN';
}

class SqliteMethods {
  static String databaseName = "crypto_currency";
  static String tableName = "coins";
  static String createCoinTable =
      'CREATE TABLE $tableName ( ${QueryStringForCoinTable.id}, ${QueryStringForCoinTable.large}, ${QueryStringForCoinTable.market_cap_rank}, ${QueryStringForCoinTable.name}, ${QueryStringForCoinTable.symbol}, ${QueryStringForCoinTable.thumb}, ${QueryStringForCoinTable.isFav})';

  static Future<Database>? initInstance() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, databaseName);
    // await deleteDatabase(path);
    var db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute(createCoinTable);
      print("table created");
    });
    return db;
  }

  static Future addCoins(Coin data, {bool isDeleted = false}) async {
    await localDbInstance!.insert(tableName, data.toDBJson()).catchError((e) {
      print(e.toString());
    });
  }

  static Future updateFavoriteStatus(int isFav, String coin) async {
    String updateQuery = "UPDATE $tableName SET ${CoinTableKeys.isFav} = $isFav WHERE ${CoinTableKeys.id} = '$coin'";
    await localDbInstance!.rawQuery(updateQuery).catchError((e) {
      toast(e.toString());
      log(e.toString());
    });
  }

  static Future deleteAllCoins() async {
    await localDbInstance!.rawQuery("DELETE FROM $tableName").catchError((e) {
      print(e.toString());
    });
    print("Deleted");
  }

  Future<List<Coin>> getSearchedCoins({String searchString = ''}) async {
    if (searchString.length >= 3) {
      var iterable = await localDbInstance!.rawQuery("SELECT * FROM $tableName WHERE ${CoinTableKeys.name} LIKE '%$searchString%' or ${CoinTableKeys.symbol} LIKE '%$searchString%' ");
      return iterable.map((e) {
        return Coin.fromDBJson(e);
      }).toList();
    } else {
      return [];
    }
  }

  static Future<List<Coin>> getCoins({int? page, int? perPage, String searchString = ''}) async {
    if (searchString.isNotEmpty) {
      var iterable = await localDbInstance!.rawQuery("SELECT * FROM $tableName WHERE ${CoinTableKeys.name} LIKE '%$searchString%' or ${CoinTableKeys.symbol} LIKE '%$searchString%' ");
      return iterable.map((e) {
        return Coin.fromDBJson(e);
      }).toList();
    } else {
      var iterable = await localDbInstance!.rawQuery("SELECT * FROM $tableName LIMIT $perPage OFFSET ${(page.validate() - 1) * perPage.validate()}  ");
      return iterable.map((e) {
        return Coin.fromDBJson(e);
      }).toList();
    }
  }

  static Future<List<Coin>> getFavoriteCoins() async {
    var iterable = await localDbInstance!.rawQuery("SELECT * FROM $tableName WHERE ${CoinTableKeys.isFav} = '1'");
    return iterable.map((e) => Coin.fromDBJson(e)).toList();
  }
}
