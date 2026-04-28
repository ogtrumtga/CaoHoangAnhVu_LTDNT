import 'package:caohoanganhvu_2324802010159_lab4/controllers/crud_services.dart';
import 'package:caohoanganhvu_2324802010159_lab4/model.dart';
import 'package:flutter/foundation.dart';

class ViewModel extends ChangeNotifier {
  List<CRUDModel> contact = [];

  Future<List<CRUDModel>> fetchContacts() async {
    final snapshot = await CrudServices().getContacts().first;
    contact = snapshot.docs.map((doc) {
      return CRUDModel(
        id: doc.id,
        name: doc['name'],
        phone: doc['phone'],
        email: doc['email'],
      );
    }).toList();

    notifyListeners();
    return contact;
  }
}
