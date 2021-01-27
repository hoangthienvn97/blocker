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
import 'package:phone_blocker/widgets/button.dart/button.dart';
import '../../core/common/commons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../home.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
      var x = await _googleSignIn.signIn();
      var y = await x.authentication;
      _loginGoogle(y.idToken);
      print(y.idToken);
    } on PlatformException catch (error) {
      print(error);
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

  String _message = Localized.get.message;

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
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      webAuthenticationOptions: WebAuthenticationOptions(
        clientId: 'com.aboutyou.dart_packages.sign_in_with_apple.example',
        redirectUri: Uri.parse(
          'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
        ),
      ),
      nonce: 'example-nonce',
      state: 'example-state',
    );

    print(credential);

    Api().loginApple(
      credential.identityToken,
      credential.familyName,
      credential.givenName,
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
            key: PreferencesKeys.Email, value: authResponse.data.user.email),
        saveString(
            key: PreferencesKeys.AvatarUrl,
            value: authResponse.data.user.avatar),
        popToRootAndPushReplacement(context, Home())
      },
      onError: (errorResponse) => {
        print(errorResponse.data.message),
      },
    );
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
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          Localized.get.introLogin.toUpperCase(),
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
                                          ..onTap = () => null,
                                        // navigatorPush(
                                        //     context, Policy()),
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
                                          ..onTap = () => null,
                                        // navigatorPush(
                                        //     context, Policy()),
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
                            label: Localized.get.loginGoogle,
                            onTap: () => _handleSignIn(),
                            textColor: Colors.black,
                            background: Colors.white,
                            borderColor: Colors.white,
                            image: Image.asset(Assets.ICON_GOOGLE_LOGIN , width: 16 , height: 16,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: ButtonLogin(
                            label: Localized.get.loginFacebook,
                            onTap: () => _loginFB(),
                            textColor: Colors.white,
                            background: AppColors.FACEBOOK,
                            borderColor: AppColors.FACEBOOK,
                            image: Image.asset(Assets.ICON_FACEBOOK_LOGIN, height: 32, width: 32,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: ButtonLogin(
                            label: Localized.get.loginApple,
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
