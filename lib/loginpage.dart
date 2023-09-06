import 'package:flutter/material.dart';
import 'package:flutter_login_template/flutter_login_template.dart';

import 'homepage.dart';

class Mylog extends StatefulWidget {
  const Mylog({super.key});

  @override
  _MylogState createState() => _MylogState();
}

enum _State {
  signIn,
  signUp,
  forgot,
  confirm,
  create,
}

class _MylogState extends State<Mylog> {
  late LoginTemplateStyle style;
  _State state = _State.signIn;

  @override
  void initState() {
    style = LoginTemplateStyle.defaultTemplate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var logo = Image.asset("assets/images/t-fast.png");

    var signInPage = LoginTemplateSignInPage(
      logo: logo,
      style: style,
      onPressedSignIn: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      onPressedSignUp: () {
        setState(() {
          state = _State.signUp;
        });
      },
      onPressedForgot: () {
        setState(() {
          state = _State.forgot;
        });
      },
/*      socialButtons: [
        LoginTemplateSocialButton(
          text: 'Apple',
          onPressed: () {},
          icon: Icon(
            Icons.account_circle_sharp,
            size: 16,
            color: style.socialButtonTextStyle.color,
          ),
          style: style,
        ),
        LoginTemplateSocialButton(
          text: 'Google',
          onPressed: () {},
          icon: Icon(
            Icons.android,
            size: 16,
            color: style.socialButtonTextStyle.color,
          ),
          style: style,
        )
      ],
      */
      term: LoginTemplateTerm(
        style: style,
        onPressedTermOfService: () {},
        onPressedPrivacyPolicy: () {},
      ),
    );

    var signUpPage = LoginTemplateSignUpPage(
      logo: logo,
      style: style,
      onPressedSignIn: () {
        setState(() {
          state = _State.signIn;
        });
      },
      onPressedSignUp: () {
        setState(() {
          state = _State.confirm;
        });
      },
      term: LoginTemplateTerm(
        style: style,
        onPressedTermOfService: () {},
        onPressedPrivacyPolicy: () {},
      ),
    );

    var forgotPasswordPage = LoginTemplateForgotPasswordPage(
        logo: logo,
        style: style,
        onPressedNext: () {
          setState(() {
            state = _State.confirm;
          });
        });

    var confirmCodePage = LoginTemplateConfirmCodePage(
      logo: logo,
      style: style,
      onPressedNext: () {
        setState(() {
          state = _State.create;
        });
      },
      onPressedResend: () {},
    );

    var createPassword = LoginTemplateCreatePasswordPage(
      logo: logo,
      style: style,
      errorTextPassword:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.',
      onPressedNext: () {
        setState(() {
          state = _State.signIn;
        });
      },
    );

    Widget body;
    switch (state) {
      case _State.signUp:
        body = signUpPage;
        break;
      case _State.forgot:
        body = forgotPasswordPage;
        break;
      case _State.confirm:
        body = confirmCodePage;
        break;
      case _State.create:
        body = createPassword;
        break;
      case _State.signIn:
      default:
        body = signInPage;
        break;
    }

    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          cardColor: Color.fromARGB(255, 153, 153, 142),
        ).copyWith(secondary: Color.fromARGB(255, 191, 190, 189)),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 108, 189, 146),
          title: Text('T-FAST'),
        ),
        body: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}
