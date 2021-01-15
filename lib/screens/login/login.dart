import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/common/preferences_keys.dart';
import 'package:phone_blocker/core/common/preferences_util.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/policy/policy.dart';
import 'package:phone_blocker/widgets/button.dart/button.dart';
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
              saveString(
                  key: PreferencesKeys.AccessToken,
                  value: authResponse.data.accessToken),
              saveString(
                key: PreferencesKeys.Name,
                value:
                    "${authResponse.data.user.lastName} ${authResponse.data.user.firstName}",
              ),
              saveString(
                  key: PreferencesKeys.Email,
                  value: authResponse.data.user.email),
              saveString(
                  key: PreferencesKeys.AvatarUrl,
                  value: authResponse.data.user.avatar),
              popToRootAndPushReplacement(context, Home())
            },
        onError: (errorResponse) => {print(errorResponse.data.message)});
  }

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  String _message = 'Log in/out by pressing the buttons below.';

  Future<Null> _loginFB() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        Api().loginFacebook(accessToken.token,
            onSuccess: (authResponse) => {
                  saveString(
                      key: PreferencesKeys.AccessToken,
                      value: authResponse.data.accessToken),
                  popToRootAndPushReplacement(context, Home())
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

  Future<void> _signInWithApple(BuildContext context) async {
    final result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);
    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIdCredential = result.credential;
        var identifyToken =
            String.fromCharCodes(appleIdCredential.identityToken);

        Api().loginApple(identifyToken, appleIdCredential.fullName.familyName,
            appleIdCredential.fullName.givenName,
            onSuccess: (authResponse) => {
                  saveString(
                      key: PreferencesKeys.AccessToken,
                      value: authResponse.data.accessToken),
                  popToRootAndPushReplacement(context, Home())
                },
            onError: (errorResponse) => {print(errorResponse.data.message)});
        break;

      case AuthorizationStatus.error:
        throw PlatformException(
          code: 'ERROR_AUTHORIZATION_DENIED',
          message: result.error.toString(),
        );

      case AuthorizationStatus.cancelled:
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      default:
        throw UnimplementedError();
    }
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
                      Localized.get.loginTitle.toUpperCase(),
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
                                      text: Localized.get.loginDescription1,
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
                                        text: Localized.get.loginDescription2,
                                        style: TextStyles.Subtitle1.apply(
                                            color: AppColors.COLOR0),
                                      ),
                                      TextSpan(
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () =>
                                              navigatorPush(context, Policy()),
                                        text: Localized.get.loginDescription3,
                                        style: TextStyles.Subtitle1.apply(
                                            color: AppColors.PRIMARY),
                                      ),
                                      TextSpan(
                                        text: Localized.get.loginDescription4,
                                        style: TextStyles.Subtitle1.apply(
                                            color: AppColors.COLOR0),
                                      ),
                                      TextSpan(
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () =>
                                              navigatorPush(context, Policy()),
                                        text: Localized.get.loginDescription5,
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
                          child: ButtonLogin(
                            label: "LOGIN WITH GOOGLE",
                            onTap: () => _handleSignIn(),
                            textColor: Colors.black,
                            background: Colors.white,
                            borderColor: Colors.white,
                            image: Image.asset(Assets.ICON_GOOGLE_LOGIN),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: ButtonLogin(
                            label: "LOGIN WITH FACEBOOK",
                            onTap: () => _loginFB(),
                            textColor: Colors.white,
                            background: AppColors.FACEBOOK,
                            borderColor: AppColors.FACEBOOK,
                            image: Image.asset(Assets.ICON_FACEBOOK_LOGIN),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: ButtonLogin(
                            label: "LOGIN WITH APPLE",
                            onTap: () => _signInWithApple(context),
                            textColor: Colors.white,
                            background: AppColors.APPLE,
                            borderColor: AppColors.APPLE,
                            image: Image.asset(Assets.ICON_APPLE_LOGIN),
                          ),
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
