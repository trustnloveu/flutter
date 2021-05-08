import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Image Picker

//* Image Preview
class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  // File (Image)
  var _storedImage;

  Future<void> _takePicker() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (imageFile != null) {
      setState(() {
        _storedImage = File(imageFile.path);
      });
    }
  }

  // build
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image Preview
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child:
              _storedImage != null
                  ? Image.file(
                      _storedImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Text(
                      'No Image Taken',
                      textAlign: TextAlign.center,
                    ),
        ),
        SizedBox(width: 10.0),

        // Button
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            // Open Camera
            onPressed: _takePicker,
          ),
        ),
      ],
    );
  }
}
