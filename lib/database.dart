import 'dart:js_util';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/expense.dart';
import 'package:flutter_application_1/models/income.dart';

class FirestoreData {
  List<Expense> income = [];


  Future<List<Expense>> getExpense()
    async {
      await FirebaseFirestore.instance
          .collection("expense")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          Expense res = Expense(
            amount: result.data()['amount'],
            category: result.data()['category'],
            type: result.data()['type']
          );
          income.add(res);
        });
        
      });
    return income;
  }

}
