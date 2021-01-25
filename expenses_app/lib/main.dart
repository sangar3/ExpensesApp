

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
            Container
            (
              width: double.infinity,
              child: Card
              (
                color: kPrimaryColor,
                child: Container
                (
                  width: 100,
                  child: Text("CHART!")
                ),
                elevation: 5,
              ),
            ),
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
