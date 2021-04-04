import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing:
                        IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
// return Card(
//   color: Colors.green[50],
//   child: Row(
//     children: [
//       Container(
//         margin:
//             EdgeInsets.symmetric(vertical: 20, horizontal: 25),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Theme.of(context).primaryColor,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         padding: EdgeInsets.all(10),
//         child: Text(
//           '\$${transactions[index].amount.toStringAsFixed(2)}',
//           style: Theme.of(context).textTheme.headline1,
//         ),
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             transactions[index].title,
//             style: Theme.of(context).textTheme.headline6,
//           ),
//           Text(
//             DateFormat('yyyy-MM-dd')
//                 .format(transactions[index].date),
//             // DateFormat.yMMMd().format(tx.date),
//             style: TextStyle(
//               color: Colors.black54,
//             ),
//           ),
//         ],
//       ),
//     ],
//   ),
// );
// },

// For ListView, not ListView.builder
// children: [
//   ...transactions.map((tx) {
//     return Card( ... );
//   }),
// ],
