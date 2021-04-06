import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime _selectedDate;

  void _submitData() {
    // input value
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

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

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
      print(pickedDate);
    });
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
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                // Android : number & iOS : numberWithOptions(decimal : true)
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                                          child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    TextButton(
                      child: Text('Input Date'),
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add Transaction'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Colors.white,
                ),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
