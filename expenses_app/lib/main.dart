

import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './constants.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SGExpenses',
      theme: ThemeData
      (
        primaryColor: kPrimaryColor, 
        accentColor: kPrimaryColor2,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.light().textTheme.copyWith
        (
          headline6: TextStyle
          (
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        appBarTheme: AppBarTheme
        (
           textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Orbitron',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions =[
    // Transaction
    // (
    //   id: 't1', 
    //   title: "Bitcoin", 
    //   amount:50.99, 
    //   date:DateTime.now() 
    // ),
    // Transaction
    // (
    //   id: 't1', 
    //   title: "Ethereum", 
    //   amount:50.99, 
    //   date:DateTime.now() 
    // )
  ]; 

  List<Transaction> get _recentTransactions
  {
    return _userTransactions.where((tx) 
    {
      return tx.date.isAfter
      (
        DateTime.now().subtract
        (
          Duration(days: 7),
        ),
      );
    }).toList();
  }
  
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


  void _startAddNewTransaction(BuildContext ctx)
  {
    showModalBottomSheet(context: ctx, 
    builder: (_) 
    {
      return GestureDetector
      (
        onTap: (){},
        child:NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    },);
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      
      appBar: AppBar
      (
        
        title: Text('SGExpenses'),
        actions: <Widget>
        [
          IconButton
          (
            icon: Icon(Icons.add), 
            onPressed:  () => _startAddNewTransaction(context),
          )
        ],
      ),

      body:  SingleChildScrollView
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>
          [
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton
      (
        child: Icon(Icons.add),
        onPressed:  () => _startAddNewTransaction(context),
      ) ,
    );
  }
}
