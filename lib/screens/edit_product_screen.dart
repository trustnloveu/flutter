import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model
import 'package:shop_app/providers/product.dart'; // Product

// Provider
import 'package:shop_app/providers/products.dart'; // Products

class EditProductScreen extends StatefulWidget {
  // Route Name
  static const routeName = '/edit-product';

  // Constructor
  EditProductScreen();

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  // GlobalKey <FormState>
  final _form = GlobalKey<FormState>();

  // Focus Node
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();

  // Controller
  final _imageUrlController = TextEditingController();

  // Initial Value for the Form
  var _editedProduct = Product(
    id: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );

  var _isInit = true;

  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  // initState
  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);

    super.initState();
  }

  // didChangeDependencies
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;

      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          // 'imageUrl': _editedProduct.imageUrl,
          'imageUrl': '',
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  // dispose for prevent memory leaks from Focus Node
  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();

    super.dispose();
  }

  // To update ImageURL & To validate the value
  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  // To Submit Data from Form
  void _saveForm() {
    // Vlidate
    final isValid =
        _form.currentState.validate(); // To trigger all validator in the Form
    if (!isValid) return; // Not Valid

    // Save the change
    _form.currentState.save();

    if (_editedProduct.id != null) {
      // Update state to Provider
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      // Add state to Provider
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }

    Navigator.of(context).pop();
  }

  // build
  @override
  Widget build(BuildContext context) {
    // return
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),

      // body
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form, // key
          // autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              // Title Input
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                // validation
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value'; // Error Message
                  }
                  return null; // No Validation Error
                },
                // onSaved
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: value,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              SizedBox(height: 20),

              // Price Input
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                focusNode: _priceFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                // validation
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    // tryParse
                    return 'Please enter a valid number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than 0';
                  }
                  return null;
                },
                // onSaved
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: _editedProduct.title,
                    price: double.parse(value),
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              SizedBox(height: 20),

              // Description Input
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                // validation
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a descripion';
                  }
                  if (value.length < 10) {
                    return 'Should be at least 10 characters long';
                  }
                  return null;
                },
                // onSaved
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: value,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              SizedBox(height: 20),

              // Image(URL) Input & Preview
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Image Preview
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Center(
                            child: Text('Enter a URL'),
                          )
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),

                  // Image(URL) Input
                  Expanded(
                    child: TextFormField(
                      // initialValue: _initValues['imageUrl'], > Error > because of Controller
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController, // controller
                      focusNode: _imageUrlFocusNode,
                      // Validation
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter an image URL';
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Please enter a valid image url';
                        }
                        if (!value.endsWith('.png') &&
                            !value.endsWith('.jpg') &&
                            !value.endsWith('.jpeg')) {
                          return 'Please enter a valid image url';
                        }
                        return null;
                      },
                      // onSaved
                      onSaved: (value) {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          description: _editedProduct.title,
                          imageUrl: value,
                        );
                      },
                      // Submit Event
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      // onEditingComplete: () {
                      // setState(() {});
                      // },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
