import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
   final List<Transaction> _userTransactions =[
    Transaction
    (
      id: 't1', 
      title: "Bitcoin", 
      amount:50.99, 
      date:DateTime.now() 
    ),
    Transaction
    (
      id: 't1', 
      title: "Ethereum", 
      amount:50.99, 
      date:DateTime.now() 
    )
  ]; 

  void _addNewTransaction(String txtitle, double txamount)
  {
    final newTx = Transaction
    (
      title: txtitle, 
      amount: txamount, 
      date: DateTime.now(),
      id: DateTime.now().toString()
    );
    
      setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  

  @override
  Widget build(BuildContext context) {
    return Column
    (
      children: <Widget>
      [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}