import 'package:flutter/material.dart';

// Widgets
import 'package:great_places_app/widgets/image_input.dart'; // ImageInput

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/app-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  // build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),

      // body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // Title Input
                    TextField(
                      controller: _titleController, // title controller
                      decoration: InputDecoration(labelText: 'title'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    
                    // Image Input
                    ImageInput(),

                    // TextButton(
                    //   child: Text('Open'),
                    //   onPressed: () {},
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            child: ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Add Place'),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Theme.of(context).accentColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
