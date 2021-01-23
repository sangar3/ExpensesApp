import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:expenses_app/constants.dart';
import'package:intl/intl.dart';
class TransactionList extends StatelessWidget 
{
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) 
  {
    return  Container
    (
      height: 300,
       child:ListView.builder
        (
          itemBuilder: (ctx,index) 
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
                      '\$${transactions[index].amount}', //string interpolation
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
                        transactions[index].title, 
                        style: TextStyle
                        (
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor2,
                        ),
                      ),
                      
                      Text //DATE
                      (
                        DateFormat.yMMMd().format(transactions[index].date),
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
          },
          itemCount:transactions.length,
          
        ),
    );
  }
}