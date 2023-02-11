import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import './models/transaction.dart';
import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return
    return MaterialApp(
      title: 'Expense Planner',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green,
              ),
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // open modal
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // )
  ];

  bool _showChart = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("AppLifeCycle check");
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Source Data
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransactions(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransactions),
        );
      },
    );
  }

  void _deleteTranscation(String id) {
    setState(() {
      _userTransactions.removeWhere((item) => item.id == id);
    });
  }

  // LandScape Widget
  List<Widget> _buildLandScapeContent(
      MediaQueryData mediaQuery, PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.headline1,
          ),
          Switch.adaptive(
            activeColor: Theme.of(context).accentColor,
            value: _showChart,
            onChanged: (val) {
              setState(() {
                _showChart = val;
              });
            },
          ),
        ],
      ),
      _showChart
          ? Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.8,
              child: Chart(_recentTransactions),
            )
          : txListWidget,
    ];
  }

  // Portrait Widget
  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQuery, PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.25,
        child: Chart(_recentTransactions),
      ),
      txListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bool isLandScape = mediaQuery.orientation == Orientation.landscape;

    // App Bar
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Expense Planner',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(
              'Expense Planner',
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
          );

    // Transaction List
    final txListWidget = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            1,
        child: TransactionList(_userTransactions, _deleteTranscation));

    // Body
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // LandScape Mode
            if (isLandScape)
              ..._buildLandScapeContent(mediaQuery, appBar, txListWidget),

            // Portrait Mode
            if (!isLandScape)
              ..._buildPortraitContent(mediaQuery, appBar, txListWidget),
          ],
        ),
      ),
    );


    // return
    return Platform.isIOS
        ? CupertinoPageScaffold(child: pageBody, navigationBar: appBar)
        : Scaffold(
            // resizeToAvoidBottomInset: false,

            // App Bar
            appBar: appBar,

            // Body
            body: pageBody,

            // Floating Button
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }
}
