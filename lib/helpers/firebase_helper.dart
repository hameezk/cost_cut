import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/offer_model.dart';

class FirebaseHelper {
  static Future<OfferModel?> getOfferModelById(String uid) async {
    OfferModel? offerModel;

    DocumentSnapshot docsnap =
        await FirebaseFirestore.instance.collection("offers").doc(uid).get();

    if (docsnap.data() != null) {
      offerModel = OfferModel.fromMap(docsnap.data() as Map<String, dynamic>);
    }
    return offerModel;
  }
  
  
}