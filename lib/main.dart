import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'Amplifier',
      amount: 19.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'New Guitar',
      amount: 99.99,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Recorder'),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.blue,
            child: Container(
              child: Text('Chart'),
              width: double.infinity,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      //styling starts

                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      // styling ends

                      child: Text(
                        '\$${tx.amount}',
                        // styling starts

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),

                        // styling ends
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          // Styling starts

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),

                          //Styling ends
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd').format(tx.date),
                          // Styling starts

                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),

                          // styling ends
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
