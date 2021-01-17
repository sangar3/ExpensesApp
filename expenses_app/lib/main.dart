import 'package:expenses_app/constants.dart';

import './transaction.dart';
import 'package:flutter/material.dart';
import './transaction.dart';
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
      title: "ethereum", 
      amount:50.99, 
      date:DateTime.now() 
    )
  ];
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
        
          children: <Widget>
          [
            Container
            (
              width: double.infinity,
              child: Card
              (
                color: Colors.blue,
                child: Container
                (
                  width: 100,
                  child: Text("CHART!")
                ),
                elevation: 5,
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
                          tx.amount.toString(),
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
                          Text
                          (
                            tx.title, 
                            style: TextStyle
                            (
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor2,
                            ),
                          ),
                          Text
                          (
                            tx.date.toString(),
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
