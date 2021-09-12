import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_airplane/model/transaction_model.dart';
import 'package:flutter_app_airplane/model/user_model.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

      CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> createTransaction(TransactionModel transactionModel) async {
    try {
      _transactionReference.add(
        {
          'destinations': transactionModel.destinationModel.toJson(),
          'amountOfTraveler': transactionModel.amountOfTraveler,
          'selectedSeat': transactionModel.selectedSeat,
          'insurance': transactionModel.insurance,
          'refundable': transactionModel.refundable,
          'vat': transactionModel.vat,
          'price': transactionModel.price,
          'grandTotal': transactionModel.grandTotal,
        },
      );
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot result = await _transactionReference.get();
      List<TransactionModel> transactions = result.docs.map(
        (e) {
          return TransactionModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return transactions;
    } catch (e) {
      throw e;
    }
  }
}
