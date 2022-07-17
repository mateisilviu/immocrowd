import 'package:flutter/material.dart';
import 'package:immocrowd/core/models/residence.dart';
import 'package:immocrowd/ui/widgets/user/app_drawer.dart';
import 'package:provider/provider.dart';

import '../../core/providers/residence-provider.dart';

class ManagePropertiesScreen extends StatefulWidget {
  static const routeName = '/manage-properties';

  const ManagePropertiesScreen({Key? key}) : super(key: key);

  @override
  State<ManagePropertiesScreen> createState() => _ManagePropertiesScreenState();
}

class _ManagePropertiesScreenState extends State<ManagePropertiesScreen> {
  final _form = GlobalKey<FormState>();

  final _descriptionFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _photoFocusNode = FocusNode();

  var _isLoading = false;

  var newResidence =
      Residence(id: '', address: '', name: '', photo: '', shortDescription: '');

  // Future<void> selectFiles() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     File file = File(result.files.single.path);
  //   } else {
  //     // User canceled the picker
  //   }
  // }

  Future<void> _saveForm() async {
    final isValid = _form.currentState?.validate();
    if (isValid == null || !isValid) {
      return;
    }
    _form.currentState?.save();
    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<ResidenceProvider>(context, listen: false)
          .addResidence(newResidence);
    } catch (error) {
      print(error);
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred!'),
          content: Text('Something went wrong.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Manage Properties'),
          actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))]),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(children: <Widget>[
            TextFormField(
              initialValue: '',
              decoration: InputDecoration(labelText: 'Name'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please provide a value.';
                }
                return null;
              },
              onSaved: (value) {
                newResidence = Residence.updateName(value!, newResidence);
              },
            ),
            TextFormField(
                initialValue: '',
                decoration: InputDecoration(labelText: 'Short description'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_addressFocusNode);
                },
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  newResidence =
                      Residence.updateShortDescription(value!, newResidence);
                }),
            TextFormField(
                initialValue: '',
                decoration: InputDecoration(labelText: 'Address'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_photoFocusNode);
                },
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  newResidence = Residence.updateAddress(value!, newResidence);
                }),
            TextFormField(
                initialValue: '',
                decoration: InputDecoration(labelText: 'Photo'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  newResidence = Residence.updatePhoto(value!, newResidence);
                })
          ]),
        ),
      ),
    );
  }
}
