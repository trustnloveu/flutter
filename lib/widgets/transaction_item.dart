import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Model
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  // Constructor
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.purple,
      Colors.black,
    ];

    // no need to wrap it with setState()
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  // build
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      elevation: 5,
      child: ListTile(
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
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
                onPressed: () => widget.deleteTx(widget.transaction.id),
              ),
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount}'),
            ),
          ),
        ),
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
