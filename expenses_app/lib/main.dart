import 'package:expenses_app/constants.dart';
import'package:intl/intl.dart';
import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions= [
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
  // Global vars
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Flutter App'),
      ),
      body: Column
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
            Card
            (
              child: Container
              (
                padding:EdgeInsets.all(10),
                child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>
                  [
                    TextField
                    (
                      decoration: InputDecoration(labelText: 'Title:'),
                      controller: titleController,
                    ),
                    TextField
                    (
                      decoration: InputDecoration(labelText: 'Amount:'),
                      controller: amountController,
                      
                    ),
                    FlatButton
                    (
                      child: Text('Add Transaction'),
                      textColor: kPrimaryColor,
                      onPressed: () 
                      {
                        print(titleController.text);
                        print(amountController.text);
                      }
                     )
                  ],
                ),
              ),
            ),
            Column
            (
              children: transactions.map((tx)  
              {
                return Card //outputs transactions title
                (
                  child: Row
                  (
                    children: <Widget>
                    [
                      Container
                      (
                        margin:EdgeInsets.symmetric
                        (
                          vertical:10, 
                          horizontal:15,
                        ),
                        decoration: BoxDecoration
                        (
                          border:Border.all
                          (
                            color: kPrimaryColor,
                            width:2,

                          )
                        ),
                        padding:EdgeInsets.all(10) ,
                        child: Text
                        (
                          '\$${tx.amount}', //string interpolation
                          style: TextStyle
                          (
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      Column
                      (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text //TITLE
                          (
                            tx.title, 
                            style: TextStyle
                            (
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor2,
                            ),
                          ),
                          
                          Text //DATE
                          (
                            DateFormat.yMd().add_jm().format(tx.date),
                            style: TextStyle
                            (
                              color: kPrimaryColor2,
                            ),
                          ),
                        ]
                    
                      )
                    ],
                  ),
                );
              }).toList()
            ),
          ],
        ),
      );
  }
}
