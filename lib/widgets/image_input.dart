import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:image_picker/image_picker.dart'; // Image Picker

//* Image Preview
class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput(this.onSelectImage);

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

      final appDir = await pathProvider.getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile.path);

      final savedImage = _storedImage.copy('${appDir.path}/$fileName');

      widget.onSelectImage(savedImage);
      // imageFile.
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
