import './widgets/user_transaction.dart';

import './constants.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
 
 
  
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
          IconButton(icon: Icon(Icons.add), onPressed: () {})
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
              UserTransactions()
            ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton
      (
        child: Icon(Icons.add),
        onPressed: () {} ,
      ) ,
    );
  }
}
