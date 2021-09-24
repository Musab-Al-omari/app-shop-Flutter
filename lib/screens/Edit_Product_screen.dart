import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_shop_flutter/providers/Products.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_flutter/providers/Products_provider.dart';

class EditProductScreen extends StatefulWidget {
  static String EditProductScreenRoute = '/EditProductScreen';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageFieldControler = TextEditingController();
  final _imageFieldFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _id;
  var _init = true;
  var _newProduct = Products(
      id: DateTime.now().toString(),
      description: '',
      imageUrl: '',
      price: 0,
      title: '');

  get parsInt => null;

  @override
  void initState() {
    // Future.delayed(Duration(seconds: 0)).then((_) {

    //   // print(_newProduct.title);
    // });
    _imageFieldFocusNode.addListener(_updateImageURL);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // to run it one time
    if (_init) {
      _id = ModalRoute.of(context)!.settings.arguments;
      //  if i go with add or edit
      if (_id != null) {
        _newProduct = Provider.of<ProductProvider>(context, listen: false)
            .oneProduct(_id);
        _imageFieldControler.text = _newProduct.imageUrl;

        _init = false;
      }
    }
    super.didChangeDependencies();
  }

//  you need to dispose them  so they dont make memory leaks
  @override
  void dispose() {
    _imageFieldFocusNode.removeListener(_updateImageURL);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageFieldFocusNode.dispose();
    _imageFieldControler.dispose();
    super.dispose();
  }

// to update the UI when the focus changed
  void _updateImageURL() {
    if (!_imageFieldFocusNode.hasFocus) {
      setState(() {});
    }
  }

// to save the form using globle key
  void _saveForm() {
    final myBool = _form.currentState!.validate();

    var ifEdited = Provider.of<ProductProvider>(context, listen: false)
        .checkProductId(_newProduct.id);

    if (myBool && ifEdited) {
      _form.currentState!.save();
      Provider.of<ProductProvider>(context, listen: false)
          .updateProduct(_newProduct);
      Navigator.of(context).pop();
      return;
    }

    if (myBool) {
      _form.currentState!.save();

      Provider.of<ProductProvider>(context, listen: false)
          .addProduct(_newProduct);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_newProduct.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('edit screen'),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            // autovalidateMode: ,
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: _newProduct.title,
                  decoration: InputDecoration(label: Text('Title')),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (value) {
                    _newProduct = Products(
                        id: _newProduct.id,
                        description: _newProduct.description,
                        imageUrl: _newProduct.imageUrl,
                        price: _newProduct.price,
                        title: value!);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You have to set a Text as Title';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  initialValue: _newProduct.price.toString(),
                  decoration: InputDecoration(label: Text('Price')),
                  textInputAction: TextInputAction.next,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _newProduct = Products(
                        id: _newProduct.id,
                        description: _newProduct.description,
                        imageUrl: _newProduct.imageUrl,
                        price: double.parse(value!),
                        title: _newProduct.title);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You have to set a Number as Price';
                    } else if (double.tryParse(value) == null) {
                      return 'Please Enter a Number';
                    } else if (double.parse(value) <= 0) {
                      return 'Try Number above zero';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  initialValue: _newProduct.description,
                  decoration: InputDecoration(
                    label: Text('description'),
                  ),
                  maxLines: 3,
                  focusNode: _descriptionFocusNode,
                  keyboardType: TextInputType.multiline,
                  onSaved: (value) {
                    _newProduct = Products(
                        id: _newProduct.id,
                        description: value!,
                        imageUrl: _newProduct.imageUrl,
                        price: _newProduct.price,
                        title: _newProduct.title);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You have to set a Text as description';
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context).colorScheme.background),
                      ),
                      child: _imageFieldControler.text.isEmpty
                          ? Text('No image')
                          : FittedBox(
                              child: Image.network(_imageFieldControler.text),
                              fit: BoxFit.fill,
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(label: Text('Text Input')),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageFieldControler,
                        focusNode: _imageFieldFocusNode,
                        onSaved: (value) {
                          _newProduct = Products(
                              id: _newProduct.id,
                              description: _newProduct.description,
                              imageUrl: value!,
                              price: _newProduct.price,
                              title: _newProduct.title);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'You have to set a url as image Url';
                          } else if (!value.startsWith('http') ||
                              !value.startsWith('https')) {
                            return 'the image should start with http or https';
                          } else {
                            return null;
                          }
                        },
                      ),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05),
                    child: ElevatedButton(
                        onPressed: _saveForm, child: Text('Submit')))
              ],
            )),
      ),
    );
  }
}
