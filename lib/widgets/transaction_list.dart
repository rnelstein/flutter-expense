import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('no transactions added yet'),
                SizedBox(height: 20),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/expense.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: CircleAvatar(
                        radius: 30,
                        child: Text('\€${transactions[index].amount}'),
                      )),
                    ),
                    title: Text(transactions[index].title),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                  ),
                );
              },
            ),
    );
  }
}
