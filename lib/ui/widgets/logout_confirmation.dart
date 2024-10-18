import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_geeksynergy/blocs/authentication/authentication_bloc.dart';

void showSignOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // Call your sign out logic here
              BlocProvider.of<AuthenticationBloc>(context).add(SignOutButttonClickedEvent());
            },
            child: const Text('Sign Out'),
          ),
        ],
      );
    },
  );
}
