import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/common/preferences_keys.dart';
import 'package:phone_blocker/core/common/preferences_util.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import '../../core/common/commons.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../home.dart';

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
          _loginGoogle(googleKey.idToken);
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

  Future<void> _loginGoogle(String googleIdToken) async {
    Api().loginGoogle(googleIdToken,
        onSuccess: (authResponse) => {
              print(1),
              saveString(
                  key: PreferencesKeys.AccessToken,
                  value: authResponse.data.accessToken),
              navigatorPush(context, Home())
            },
        onError: (errorResponse) => {print(errorResponse.data.message)});
  }

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  String _message = 'Log in/out by pressing the buttons below.';

  Future<Null> _loginFB() async {
    final FacebookLoginResult result =
        await facebookSignIn.logIn(['email']);
  print(result);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
       Api().loginFacebook(accessToken.token,
        onSuccess: (authResponse) => {
              print(1),
              saveString(
                  key: PreferencesKeys.AccessToken,
                  value: authResponse.data.accessToken),
              navigatorPush(context, Home())
            },
        onError: (errorResponse) => {print(errorResponse.data.message)});
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_LIGHT,
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
                    child: Text(
                      "Project Your Phone Call".toUpperCase(),
                      style: TextStyles.Button.apply(color: AppColors.PRIMARY),
                    )),
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
                        Text(
                          "Login".toUpperCase(),
                          style: TextStyles.Headline1.apply(
                              color: AppColors.PRIMARY),
                        ),
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
                                      style: TextStyles.Subtitle1.apply(
                                          color: AppColors.COLOR0),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: 'our',
                                        style: TextStyles.Subtitle1.apply(
                                            color: AppColors.COLOR0),
                                      ),
                                      TextSpan(
                                        text: ' Term of Service',
                                        style: TextStyles.Subtitle1.apply(
                                            color: AppColors.PRIMARY),
                                      ),
                                      TextSpan(
                                        text: ' and',
                                        style: TextStyles.Subtitle1.apply(
                                            color: AppColors.COLOR0),
                                      ),
                                      TextSpan(
                                        text: ' Privacy Policy',
                                        style: TextStyles.Subtitle1.apply(
                                            color: AppColors.PRIMARY),
                                      ),
                                    ],
                                  ),
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
                              onTap: () => _loginFB(),
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
