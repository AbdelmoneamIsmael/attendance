import 'package:attendance/core/const/app_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseHelper {
  static FireBaseHelper? instance;

  static FireBaseHelper getInstance() {
    instance ??= FireBaseHelper();
    return instance!;
  }

  var firestore = FirebaseFirestore.instance;

  Future<void> insertData(
    List<String> collectionName,
    List<String> docsNames,
    Map<String, dynamic> data,
  ) async {
    var query = firestore.collection(collectionName[0]).doc(docsNames[0]);

    for (int i = 1; i < collectionName.length; i++) {
      query = query.collection(collectionName[i]).doc(docsNames[i]);
    }
    return await query.set(data);
  }

  Future<String> getDocID() async {
    String docId = firestore.collection(FireBaseTabels.employees).doc().id;
    print("Document ID: $docId");
    return docId;
  }
}
