import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lnwcoin/services/keys.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nb_utils/nb_utils.dart';

FirebaseStorage _storage = FirebaseStorage.instance;

abstract class BaseService<T> {
  CollectionReference<T>? ref;

  BaseService({this.ref});

  Future<DocumentReference> addDocument(T data) async {
    var doc = await ref!.add(data);
    Map<String, dynamic> updateData = {commonKeys.uid: doc.id};
    doc.update(updateData);
    return doc;
  }

  Future<DocumentReference> addDocumentWithCustomId(String id, dynamic data) async {
    var doc = ref!.doc(id);

    return await doc.set(data).then((value) {
      log('Added: $data');

      return doc;
    }).catchError((e) {
      log(e);
      throw e;
    });
  }

  Future<void> updateDocument(Map<String, dynamic> data, String? id) => ref!.doc(id).update(data);

  Future<void> removeDocument(String id) => ref!.doc(id).delete();

  Future<bool> isUserExist(String? email) async {
    Query query = ref!.limit(1).where('email', isEqualTo: email);
    var res = await query.get();

    if (res.docs.isNotEmpty) {
      return res.docs.length == 1;
    } else {
      return false;
    }
  }

  Future<Iterable> getList() async {
    var res = await ref!.get();
    Iterable it = res.docs;
    return it;
  }

  Future<String> getUploadedImageURL({required File image, required String fileName, String? path}) async {
    Reference storageRef = _storage.ref().child("$path/$fileName");
    UploadTask uploadTask = storageRef.putFile(image);
    return await uploadTask.then(
      (e) async {
        return await e.ref.getDownloadURL().then(
          (value) {
            return value;
          },
        );
      },
    );
  }

  Future<String> getUploadedImageURLFromWeb({required Uint8List image, required String path, required String extension, required String fileName}) async {
    Reference storageRef = _storage.ref().child("$path/${fileName.split(".")[0]}.$extension");
    log(storageRef.name);
    UploadTask uploadTask = storageRef.putData(image);
    return await uploadTask.then((e) async {
      return await e.ref.getDownloadURL().then((value) {
        return value;
      });
    }).catchError((e) {
      log("e.toString() ${e.toString()}");
    });
  }

  Future<String> deleteImage(String url) async {
    Reference fileUrl = _storage.refFromURL(url);
    return fileUrl.delete().then(
      (value) {
        return "Deleted Completed";
      },
    ).catchError(
      (e) {
        toast(e.toString());
      },
    );
  }
}
