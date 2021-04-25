import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Model & Provider
import 'package:shop_app/providers/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  // Contructor
  OrderItem(
    this.order,
  );

  // build
  @override
  Widget build(BuildContext context) {
    // return
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('yyyy-MM-dd HH:mm').format(order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
