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
      "height": 0,
      "weight": 0,
      "age": 0,
      "gender": -1,
      "uid": uid,
      "records": [],
      "COVID-19": [],
      "Diabetes": [],
      "Heart Disease": [],
      "Lung Cancer": [],
    });
  }

  Future initialUserData(double height, double weight, int age) async {
    return await userCollection.doc(uid).update({
      "height": height,
      "weight": weight,
      "age": age,
      //"gender": gender,
    });
  }

  Future updateRecords(String newRecords) async {
    return await userCollection.doc(uid).update({
      "records": FieldValue.arrayUnion([newRecords])
    });
  }

  Future resultRecords(String newRecords, String prediction) async {
    return await userCollection.doc(uid).update({
      prediction: FieldValue.arrayUnion([newRecords])
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
    try {
      int age = firstDocumentSnapshot.get('age');
      return age;
    } catch (e) {
      // Handle the exception here
      print('Error getting age: $e');
      // Return a default value or rethrow the exception
      return 0;
    }
  }

  Future<String> getGender(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot firstDocumentSnapshot = snapshot.docs[0];
    try {
      String gender = firstDocumentSnapshot.get('gender');
      return gender;
    } catch (e) {
      // Handle the exception here
      print('Error getting age: $e');
      // Return a default value or rethrow the exception
      return "Undefined";
    }
  }

  Future<double> getHeight(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot firstDocumentSnapshot = snapshot.docs[0];
    try {
      double height = firstDocumentSnapshot.get('height');
      return height;
    } catch (e) {
      // Handle the exception here
      print('Error getting height: $e');
      // Return a default value or rethrow the exception
      return 0;
    }
  }

  Future<double> getWeight(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    QueryDocumentSnapshot firstDocumentSnapshot = snapshot.docs[0];
    try {
      double weight = firstDocumentSnapshot.get('weight');
      return weight;
    } catch (e) {
      // Handle the exception here
      print('Error getting weight: $e');
      // Return a default value or rethrow the exception
      return 0;
    }
  }

  getRecordsGroups() async {
    return userCollection.doc(uid).snapshots();
  }
}
