import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(
    this.transactions,
    this.deleteTx,
  );

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
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
                  trailing: MediaQuery.of(context).size.width > 450
                      ? TextButton.icon(
                          label: Text('Delete'),
                          icon: Icon(Icons.delete),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Theme.of(context).errorColor,
                          ),
                          onPressed: () {},
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
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
