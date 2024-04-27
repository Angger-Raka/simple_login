import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isExpandedIllustrationVisible = true;

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {
        isExpandedIllustrationVisible =
            !emailFocusNode.hasFocus && !passwordFocusNode.hasFocus;
      });
    });
    passwordFocusNode.addListener(() {
      setState(() {
        isExpandedIllustrationVisible =
            !emailFocusNode.hasFocus && !passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              flex: isExpandedIllustrationVisible ? 4 : 0,
              child: isExpandedIllustrationVisible
                  ? Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(60),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                      ),
                      child: SvgPicture.asset(
                        MainAssets.ilustLogin,
                      ),
                    )
                  : SizedBox(),
            ),
            isExpandedIllustrationVisible ? 0.sbh : 50.sbh,
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Login',
                        style: TextStyles.textSemiboldHeaderM,
                      ),
                    ),
                    15.sbh,
                    TextForm(
                      controller: emailController,
                      label: 'Email',
                      focusNode: emailFocusNode,
                    ),
                    10.sbh,
                    TextForm(
                      controller: passwordController,
                      label: 'Password',
                      focusNode: passwordFocusNode,
                    ),
                    15.sbh,
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          context.go(NamedRoutes.home);
                        },
                        child: Text(
                          'Login',
                          style: TextStyles.textSemiboldL,
                        ),
                      ),
                    ),
                    20.sbh,
                    //make e text with line 'or continue with'
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(child: Divider()),
                        10.sbw,
                        Text(
                          'or continue with',
                          style: TextStyles.textRegularS,
                        ),
                        10.sbw,
                        const Expanded(child: Divider()),
                      ],
                    ),
                    20.sbh,
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(
                            onPressed: () {
                              // Handle Google login
                            },
                            icon: MainAssets.icGoogle,
                          ),
                          10.sbw,
                          SocialButton(
                            onPressed: () {
                              // Handle Facebook login
                            },
                            icon: MainAssets.icFacebook,
                          ),
                          10.sbw,
                          SocialButton(
                            onPressed: () {
                              // Handle Twitter login
                            },
                            icon: MainAssets.icApple,
                          ),
                        ],
                      ),
                    ),
                    10.sbh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyles.textRegularS,
                        ),
                        TextButton(
                          onPressed: () {
                            context.push(NamedRoutes.register);
                          },
                          child: Text(
                            'Register',
                            style: TextStyles.textRegularS,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
