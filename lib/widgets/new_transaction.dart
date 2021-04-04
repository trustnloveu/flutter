import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    // input value
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // For validation check
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    // execute
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    // auto close
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                // Android : number & iOS : numberWithOptions(decimal : true)
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitData(),
                onChanged: (value) {
                  // amountInput = value;
                },
              ),
              ElevatedButton(
                child: Text('Add Transaction'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Colors.white,
                ),
                onPressed: submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
