import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudServices {
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> addNewContact(String name, String phone, String email) async {
    Map<String, String> contact = {
      "name": name,
      "phone": phone,
      "email": email,
    };
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .add(contact);
      print("Contact added successfully");
    } catch (e) {
      print("Failed to add contact: $e");
    }
  }

  Stream<QuerySnapshot> getContacts({String? searchQuery}) async* {
    var contactsQuery = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("contacts")
        .orderBy("name");

    if (searchQuery != null && searchQuery.isNotEmpty) {
      String searchEnd = searchQuery + "\uf8ff";
      contactsQuery = contactsQuery.where(
        "name",
        isGreaterThanOrEqualTo: searchQuery,
        isLessThan: searchEnd,
      );
    }

    var contacts = contactsQuery.snapshots();
    yield* contacts;
  }

  Future<void> updateContact(
    String docID,
    String name,
    String phone,
    String email,
  ) async {
    Map<String, String> contact = {
      "name": name,
      "phone": phone,
      "email": email,
    };
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("contacts")
        .doc(docID)
        .update(contact);
  }

  Future<void> deleteContact(String docID) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .delete();

      print("Contact deleted successfully");
    } catch (e) {
      print("Failed to delete contact: $e");
    }
  }
}
