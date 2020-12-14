import 'package:flutter/material.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/common/preferences_keys.dart';
import 'package:phone_blocker/core/common/preferences_util.dart';
import 'package:phone_blocker/screens/community/community.dart';
import '../../core/common/commons.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn gSignIn = GoogleSignIn();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> _handleSignIn() async {
    try {
      _googleSignIn.signIn().then((result) {
        result.authentication.then((googleKey) {
          print(googleKey.idToken);
          _login(googleKey.idToken);
        }).catchError((err) {
          print('inner error');
        });
      }).catchError((err) {
        print('error occured');
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> _login(String googleIdToken) async {
    Api().login(googleIdToken,
        onSuccess: (authResponse) => {
              saveString(
                  key: PreferencesKeys.AccessToken,
                  value: authResponse.data.accessToken),
              navigatorPush(context, Community())
            },
        onError: (errorResponse) => {
          print(errorResponse.data.message)
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2EFFA),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(Assets.ICON_LOGO_LOGIN)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextStyleText("Project Your Phone Call".toUpperCase(),
                      14, FontWeight.w500, 0, ConfigColor.TEXT),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    Assets.ICON_ELLIPSE_LOGIN,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        TextStyleText("login".toUpperCase(), 32,
                            FontWeight.w500, 0, ConfigColor.TEXT),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'By logging in, you agree with',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        letterSpacing: 0.5,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'our',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        letterSpacing: 0.5,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Term of Service',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: 0.5,
                                        color: ConfigColor.TEXT,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' and',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    TextSpan(
                                      text: ' Privacy Policy',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: 0.5,
                                        color: ConfigColor.TEXT,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: GestureDetector(
                              onTap: () => _handleSignIn(),
                              child: Image.asset(Assets.ICON_GOOGLE_LOGIN)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: GestureDetector(
                              onTap: () => print("bbbb"),
                              child: Image.asset(Assets.ICON_FACEBOOK_LOGIN)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: GestureDetector(
                              onTap: () => print("ccccc"),
                              child: Image.asset(Assets.ICON_APPLE_LOGIN)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
