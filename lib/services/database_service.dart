import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  Future savingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "uid": uid,
    });
  }

  Future initialUserData(double height, double weight, int age) async {
    return await userCollection.doc(uid).update({
      "height": height,
      "weight": weight,
      "age": age,
      //"gender": gender,
      "uid": uid,
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future<int> getAge(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot firstDocumentSnapshot = snapshot.docs[0];
    return firstDocumentSnapshot.get('age');
  }

  Future<int> getHeight(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot firstDocumentSnapshot = snapshot.docs[0];
    return firstDocumentSnapshot.get('height');
  }

  Future<int> getWeight(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot firstDocumentSnapshot = snapshot.docs[0];
    return firstDocumentSnapshot.get('weight');
  }
}
