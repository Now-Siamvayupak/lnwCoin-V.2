import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/portfolio_model.dart';
import 'package:lnwcoin/services/base_service.dart';
import 'package:lnwcoin/services/keys.dart';
import 'package:nb_utils/nb_utils.dart';

class PortfolioService extends BaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  PortfolioService() {
    ref = firestore.collection(collections.user).doc(appStore.uid).collection(collections.portfolio);
  }

  Future<void> addNewPortfolio({Map<String, dynamic>? userRequest, Map<String, dynamic>? portfolioRequest}) async {
    await userService.userExist(uid: appStore.uid).then((value) {
      if (value.size == 0) {
        userService.addDocumentWithCustomId(appStore.uid, userRequest!).then((value) {
          userService.ref!.doc(value.id).collection(collections.portfolio).add(portfolioRequest!).then((value) {
            value.update({userKeys.uid: value.id});
          }).catchError((e) {
            log(e.toString());
          });
        }).catchError((e) {
          log(e.toString());
        });
      } else {
        userService.ref!.doc(appStore.uid).collection(collections.portfolio).add(portfolioRequest!).then((value) {
          value.update({userKeys.uid: value.id});
        }).catchError((e) {
          log(e.toString());
        });
        log(value.docs.length);
      }
    }).catchError((e) {
      log(e.toString());
    });
    return;
  }

  Stream<List<PortfolioModel>> getPortfolioList() {
    return ref!.snapshots().map(
          (event) => event.docs.map((e) => PortfolioModel.fromJson(e.data())).toList(),
        );
  }
}
