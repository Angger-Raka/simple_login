import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  bool _isIlustRegisterVisible = true;

  @override
  void initState() {
    super.initState();
    _fullNameFocusNode.addListener(_onFocusChange);
    _emailFocusNode.addListener(_onFocusChange);
    _passwordFocusNode.addListener(_onFocusChange);
    _confirmPasswordFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isIlustRegisterVisible = !_fullNameFocusNode.hasFocus &&
          !_emailFocusNode.hasFocus &&
          !_passwordFocusNode.hasFocus &&
          !_confirmPasswordFocusNode.hasFocus;
    });
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
              flex: _isIlustRegisterVisible ? 4 : 0,
              child: _isIlustRegisterVisible
                  ? Stack(
                      children: [
                        if (_isIlustRegisterVisible)
                          Container(
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
                              MainAssets.ilustRegister,
                            ),
                          ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: CircleButton(
                              onPressed: () {
                                context.pop();
                              },
                              widget: const Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
            Expanded(
              flex: 6,
              child: SafeArea(
                top: !_isIlustRegisterVisible,
                bottom: !_isIlustRegisterVisible,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _isIlustRegisterVisible
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Register',
                                style: TextStyles.btextSemiboldHeaderM,
                              ),
                            )
                          : Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                ),
                                // 10.sbw,
                                Text(
                                  'Register',
                                  style: TextStyles.btextSemiboldHeaderM,
                                ),
                              ],
                            ),
                      20.sbh,
                      TextForm(
                        label: 'Full Name',
                        controller: TextEditingController(),
                        focusNode: _fullNameFocusNode,
                      ),
                      20.sbh,
                      TextForm(
                        label: 'Email',
                        controller: TextEditingController(),
                        focusNode: _emailFocusNode,
                      ),
                      20.sbh,
                      TextForm(
                        label: 'Password',
                        controller: TextEditingController(),
                        focusNode: _passwordFocusNode,
                      ),
                      20.sbh,
                      TextForm(
                        label: 'Confirm Password',
                        controller: TextEditingController(),
                        focusNode: _confirmPasswordFocusNode,
                      ),
                      20.sbh,
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: () {
                            context.go('/home');
                          },
                          child: const Text('Register'),
                        ),
                      ),
                      10.sbh,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              context.go('/login');
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
