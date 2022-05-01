import 'package:flutter/material.dart';

class NewResidence extends StatelessWidget {
  final Function addAp;

  final nameController = TextEditingController();
  final shortDescriptionController = TextEditingController();
  final addressController = TextEditingController();
  final photoController = TextEditingController();

  NewResidence(this.addAp);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Short description'),
              controller: shortDescriptionController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Address'),
              controller: addressController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Photo'),
              controller: photoController,
            ),
            FlatButton(
              child: Text('Add Apartment'),
              textColor: Colors.green,
              onPressed: () {
                //String name, String address, String photo, String shortDescription)
                addAp(nameController.text, addressController.text,
                    photoController.text, shortDescriptionController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
