import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../home/home_page.dart';

class FormBodyFirebase extends StatelessWidget {
  FormBodyFirebase({
    Key? key,
  }) : super(key: key);

  final _clientId = String.fromEnvironment('GOOGLE_API_KEY');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SignInScreen(
        headerBuilder: (context, constraints, shrinkOffset) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Center(
              child: Text(
                'Fire Tweeter',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          );
        },
        footerBuilder: (context, action) {
          return Container(
            height: 50,
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                onPressed: ({action}) {},
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
        providerConfigs: [
          EmailProviderConfiguration(),
          GoogleProviderConfiguration(clientId: _clientId),
        ],
        actions: [
          AuthStateChangeAction<SignedIn>(
            ((context, state) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

// https://firebase.flutter.dev/docs/ui/auth
