import '../constants.dart';
import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import'package:intl/intl.dart';
class TransactionList extends StatelessWidget 
{
  final List<Transaction> transactions;
  final Function deleteTx;


  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) 
  {
    return  Container
    (
      height: 300,
       child: transactions.isEmpty ? Column
       (
         children: <Widget>
         [
           Text
           (
             "No Transactions added yet",
             style: Theme.of(context).textTheme.headline6,
           ),

           SizedBox //Seprator
           (
              height: 10,
           ),

           Container
           (
             height: 200,
             child: Image.asset
             (
               'assets/images/waiting.png', fit:BoxFit.cover
             )
           ),
         ],
       ) : 
       ListView.builder // checks if transaction list is emplty 
        (
          itemBuilder: (ctx,index) 
          {
            return Card
            (
              elevation: 5,
              margin:EdgeInsets.symmetric
              (
                vertical:8, 
                horizontal:5,
              ),
              child: ListTile
              (
                leading: CircleAvatar
                (
                  backgroundColor:kPrimaryColor,
                  radius: 30, 
                  
                  child: Padding
                  (
                    padding: EdgeInsets.all(6),
                    child: FittedBox
                    (
                      child: Text
                      (
                        '\$${transactions[index].amount}',
                        style: TextStyle
                        (
                          color: Colors.white.withOpacity(1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                title: Text
                (
                  transactions[index].title,
                  style: Theme.of(context).textTheme.headline6
                ),
                subtitle: Text
                (
                  DateFormat.yMMMd().format(transactions[index].date),
                  style: TextStyle
                  (
                    color: Colors.grey,
                  )   
                ),
                trailing: IconButton
                (
                  icon: Icon(Icons.delete), 
                  color: Theme.of(context).errorColor,
                  onPressed: () => deleteTx(transactions[index].id),
                ),
              ),
            );
          },
          itemCount:transactions.length,
        ),
    );
  }
}