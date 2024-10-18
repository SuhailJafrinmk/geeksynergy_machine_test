import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:machine_test_geeksynergy/blocs/authentication/authentication_bloc.dart';
import 'package:machine_test_geeksynergy/data/models/user_model.dart';
import 'package:machine_test_geeksynergy/resources/asset_paths.dart';
import 'package:machine_test_geeksynergy/resources/input_validators.dart';
import 'package:machine_test_geeksynergy/ui/screens/home_screen.dart';
import 'package:machine_test_geeksynergy/ui/screens/signup_screen.dart';
import 'package:machine_test_geeksynergy/ui/widgets/custom_buton.dart';
import 'package:machine_test_geeksynergy/ui/widgets/custom_texfield.dart';
import 'package:machine_test_geeksynergy/ui/widgets/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool hideText = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if(state is UserAuthenticationSuccess){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
        }else if(state is UserAuthenticationFailed){
          ScaffoldMessenger.of(context).showSnackBar(customSnackbar(context, true, state.message));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //animated image
              Expanded(
                flex: 3,
                child: Lottie.asset(AppAssetPaths.loginLottieAnimation),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    'Welcome back',
                    style: theme.textTheme.headlineLarge,
                  )),

              Expanded(
                flex: 4,
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                          ),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10, top: 20),
                              child: CustomTexfield(
                                  validator: (value) =>
                                      InputValidator.validateEmail(value),
                                  obscureText: false,
                                  prefixIconWidget:
                                      const Icon(Icons.account_circle_rounded),
                                  controller: emailController,
                                  hintText: 'Enter Your Email',
                                  labelText: 'Email'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10, top: 10),
                              child: CustomTexfield(
                                  validator: (value) =>
                                      InputValidator.validatePassword(value),
                                  obscureText: hideText,
                                  prefixIconWidget: const Icon(Icons.lock),
                                  sufixIconWidget: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hideText == false
                                              ? hideText = true
                                              : hideText = false;
                                        });
                                      },
                                      icon: Icon(hideText == false
                                          ? Icons.visibility
                                          : Icons.visibility_off)),
                                  controller: passwordController,
                                  hintText: 'Enter Your Password',
                                  labelText: 'Password'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                                height: 60,
                                width: width * .84,
                                elevation: 20,
                                color: Colors.teal.shade800,
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    UserModel userModel = UserModel(
                                        userEmail: emailController.text,
                                        userPassword: passwordController.text);
                                        BlocProvider.of<AuthenticationBloc>(context).add(SignInButtonClicked(userModel: userModel));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Provide right credentials')));
                                  }
                                },
                                radius: 20,
                                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                                  builder: (context, state) {
                                    if(state is SigninLoading){
                                      return const CircularProgressIndicator();
                                    }
                                    return Text('Login',
                                    style: theme.textTheme.titleLarge);
                                  },
                                )
                                    ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('don\'t have an account',
                                    style: theme.textTheme.labelMedium),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignupScreen()));
                                    },
                                    child: const Text("SignUp"))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ])),
                    ),
                  ),
                ),
              )

              //textfield password
            ],
          ),
        ),
      ),
    );
  }
}
