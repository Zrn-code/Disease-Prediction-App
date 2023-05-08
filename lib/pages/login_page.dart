import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../helper/helper_functions.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../widgets/widgets.dart';
import 'main_page.dart';
import 'package:animated_login/animated_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

String lang = "EN";

class _LoginScreenState extends State<LoginScreen> {
  LanguageOption language = _languageOptions[0];
  AuthMode currentMode = AuthMode.login;
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return AnimatedLogin(
      showPasswordVisibility: true,
      formKey: GlobalKey<FormState>(),
      onLogin: LoginFunctions(context).onLogin,
      onSignup: LoginFunctions(context).onSignup,
      //onForgotPassword: LoginFunctions(context).onForgotPassword,
      //logo: Image.asset('assets/images/logo.gif'),
      //backgroundImage: "./images/background.jpg",
      signUpMode: SignUpModes.both,
      loginDesktopTheme: _desktopTheme,
      loginMobileTheme: _mobileTheme,
      loginTexts: _loginTexts,
      initialMode: currentMode,
      passwordValidator: _passwordValidator,
      onAuthModeChange: (AuthMode newMode) => currentMode = newMode,
      languageOptions: _languageOptions,
      selectedLanguage: language,
      changeLanguageCallback: (LanguageOption? _language) {
        if (_language != null) {
          if (mounted)
            setState(() {
              language = _language;
              lang = _language.code;
            });

          DialogBuilder(context).showResultDialog(language.code == "ZH"
              ? '成功將語言調整為: ${_language.value}。'
              : 'Successfully changed the language to: ${_language.value}.');
        }
      },
    );
  }

  static List<LanguageOption> get _languageOptions => const <LanguageOption>[
        LanguageOption(
          value: 'English',
          code: 'EN',
        ),
        LanguageOption(value: '中文', code: 'ZH'),
      ];

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *DESKTOP* view.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginViewTheme get _desktopTheme => _mobileTheme.copyWith(
        // To set the color of button text, use foreground color.
        actionButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        backgroundColor: Colors.blue,

        dialogTheme: const AnimatedDialogTheme(
          languageDialogTheme: LanguageDialogTheme(
              optionMargin: EdgeInsets.symmetric(horizontal: 80)),
        ),
      );

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *MOBILE* view.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginViewTheme get _mobileTheme => LoginViewTheme(
        // showLabelTexts: false,
        // animatedComponentOrder: <AnimatedComponent>[],
        backgroundColor: Colors.blueGrey, // const Color(0xFF6666FF),
        formFieldBackgroundColor: Colors.white,
        formWidthRatio: 60,
        actionButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.blueGrey),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  LoginTexts get _loginTexts => LoginTexts(
        selectedLanguage: language,
        nameHint: language.code == "ZH" ? "使用者名稱" : 'Username',
        login: language.code == "ZH" ? "登入" : 'Login',
        signUp: language.code == "ZH" ? "註冊" : 'Sign Up',
        welcome: language.code == "ZH" ? "疾病預測系統" : 'Disease Prediction',
        welcomeBack: language.code == "ZH" ? "歡迎回來" : 'Welcome Back',
        welcomeDescription:
            language.code == "ZH" ? "為了健康，付出行動吧" : 'Sign up for your health!',
        welcomeBackDescription:
            language.code == "ZH" ? "為了健康，付出行動吧" : 'Sign up for your health!',
        signUpFormTitle: language.code == "ZH" ? "註冊" : 'Sign Up',
        loginUseEmail: language.code == "ZH" ? "使用電子郵件登入" : 'Login with Email',
        forgotPassword: language.code == "ZH" ? "忘記密碼了嗎?" : 'Forgot Password?',
        emailHint: language.code == "ZH" ? "電子郵件" : 'Email',
        notHaveAnAccount: language.code == "ZH" ? "還沒有帳號嗎?" : 'No account?',
        passwordHint: language.code == "ZH" ? "密碼" : 'Password',
        confirmPasswordHint:
            language.code == "ZH" ? "確認密碼" : 'Confirm Password',
        chooseLanguageTitle: language.code == "ZH" ? "選擇語言" : 'Choose Language',
        loginFormTitle:
            language.code == "ZH" ? "登入你的帳號吧" : 'Login to your account',
        alreadyHaveAnAccount:
            language.code == "ZH" ? "已經有帳號了嗎?" : 'Already have an account?',
      );

  ValidatorModel get _passwordValidator => const ValidatorModel(
        length: 6,
        checkUpperCase: false,
        checkLowerCase: false,
        checkSpace: false,
      );
}

class LoginFunctions {
  LoginFunctions(this.context);
  final BuildContext context;
  AuthService authService = AuthService();

  /// Login action that will be performed on click to action button in login mode.
  Future<String?> onLogin(LoginData loginData) async {
    await authService
        .loginWithUserNameandPassword(loginData.email, loginData.password)
        .then((value) async {
      if (value == true) {
        QuerySnapshot snapshot =
            await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                .gettingUserData(loginData.email);
        await HelperFunctions.saveUserLoggedInStatus(true);
        await HelperFunctions.saveUserEmailSF(loginData.email);
        await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
        nextScreenReplace(context, MainPage());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Failed'),
          ),
        );
      }
    });
    return null;
  }

  /// Sign up action that will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData signupData) async {
    await authService
        .registerUserWithEmailandPassword(
            signupData.name, signupData.email, signupData.password)
        .then((value) async {
      if (value == true) {
        await HelperFunctions.saveUserLoggedInStatus(true);
        await HelperFunctions.saveUserEmailSF(signupData.email);
        await HelperFunctions.saveUserNameSF(signupData.name);
        nextScreenReplace(context, const MainPage());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign Up Failed'),
          ),
        );
      }
    });

    return null;
  }

  Future<String?> onForgotPassword(String email) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pop();
    // You should determine this path and create the screen.
    // Navigator.of(context).pushNamed('/forgotPass');
    DialogBuilder(context)
        .showResultDialog(lang_map[lang]!["Handling forgotten password"]);
    return null;
  }
}

class DialogBuilder {
  /// Builds various dialogs with different methods.
  /// * e.g. [showLoadingDialog], [showResultDialog]
  const DialogBuilder(this.context);
  final BuildContext context;

  /// Example loading dialog
  Future<void> showLoadingDialog() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: const AlertDialog(
            content: SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF6666FF),
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
        ),
      );

  /// Example result dialog
  Future<void> showResultDialog(String text) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: SizedBox(
            height: 100,
            width: 100,
            child: Center(child: Text(text, textAlign: TextAlign.center)),
          ),
        ),
      );
}
