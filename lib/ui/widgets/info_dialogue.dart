import 'package:flutter/material.dart';

void showInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: const Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,  // Ensures the dialog is sized according to content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.business, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  'Company:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 32, bottom: 8),
              child: Text('Geeksynergy Technologies Pvt Ltd'),
            ),
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.redAccent),
                SizedBox(width: 8),
                Text(
                  'Address:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 32, bottom: 8),
              child: Text('Sanjayanagar, Bengaluru - 56'),
            ),
            Row(
              children: const [
                Icon(Icons.phone, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Phone:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 32, bottom: 8),
              child: Text('XXXXXXXXX09'),
            ),
            Row(
              children: const [
                Icon(Icons.email, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  'Email:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 32),
              child: Text('geeksynergy@gmail.com'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      );
    },
  );
}
