import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:machine_test_geeksynergy/blocs/authentication/authentication_bloc.dart';
import 'package:machine_test_geeksynergy/data/models/user_model.dart';
import 'package:machine_test_geeksynergy/resources/asset_paths.dart';
import 'package:machine_test_geeksynergy/resources/input_validators.dart';
import 'package:machine_test_geeksynergy/ui/screens/home_screen.dart';
import 'package:machine_test_geeksynergy/ui/screens/login_screen.dart';
import 'package:machine_test_geeksynergy/ui/widgets/custom_buton.dart';
import 'package:machine_test_geeksynergy/ui/widgets/custom_texfield.dart';
import 'package:machine_test_geeksynergy/resources/profession_enum.dart';
import 'package:machine_test_geeksynergy/ui/widgets/snackbar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserProfession? selectedProfession; // Nullable type to allow no selection
  final formKey = GlobalKey<FormState>();
  bool hideText = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
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
        if (state is NewUserSigned) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Animated image
              SizedBox(
                height: height * .25,
                width: width,
                child: Lottie.asset(AppAssetPaths.loginLottieAnimation),
              ),
              Text(
                'Create your account!',
                style: theme.textTheme.headlineSmall,
              ),

              // Textfield for user information
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Color.fromARGB(179, 233, 227, 227),
                        ),
                        child: Column(
                          children: [
                            // Name field
                            CustomTexfield(
                              validator: (value) => InputValidator.validateUsername(value),
                              obscureText: false,
                              prefixIconWidget: const Icon(Icons.person),
                              controller: nameController,
                              hintText: 'Enter Your Name',
                              labelText: 'Name',
                            ),
                            const SizedBox(height: 20), // Consistent spacing

                            // Phone Number field
                            CustomTexfield(
                              validator: (value) => InputValidator.validatePhoneNumber(value),
                              obscureText: false,
                              prefixIconWidget: const Icon(Icons.phone),
                              controller: phoneNumberController,
                              hintText: 'Enter Your Phone Number',
                              labelText: 'Phone Number',
                            ),
                            const SizedBox(height: 20),

                            // Email field
                            CustomTexfield(
                              validator: (value) => InputValidator.validateEmail(value),
                              obscureText: false,
                              prefixIconWidget: const Icon(Icons.email),
                              controller: emailController,
                              hintText: 'Enter Your Email',
                              labelText: 'Email',
                            ),
                            const SizedBox(height: 20),

                            // Password field
                            CustomTexfield(
                              validator: (value) => InputValidator.validatePassword(value),
                              obscureText: hideText,
                              prefixIconWidget: const Icon(Icons.lock),
                              sufixIconWidget: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hideText = !hideText;
                                  });
                                },
                                icon: Icon(hideText ? Icons.visibility_off : Icons.visibility),
                              ),
                              controller: passwordController,
                              hintText: 'Enter Your Password',
                              labelText: 'Password',
                            ),
                            const SizedBox(height: 20),

                            // Profession dropdown
                            DropdownButtonFormField<UserProfession>(
                              decoration: InputDecoration(
                                labelText: 'Select Your Profession',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              value: selectedProfession,
                              items: UserProfession.values.map((profession) {
                                return DropdownMenuItem<UserProfession>(
                                  value: profession,
                                  child: Text(profession.name),
                                );
                              }).toList(),
                              onChanged: (UserProfession? value) {
                                setState(() {
                                  selectedProfession = value;
                                });
                              },
                              validator: (value) => value == null ? 'Please select a profession' : null,
                            ),
                            const SizedBox(height: 30), // Bigger space before the button

                            // Sign Up button
                            CustomButton(
                              height: 60,
                              width: width * .84,
                              elevation: 20,
                              color: Colors.teal.shade800,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  final UserModel userModel = UserModel(
                                    userEmail: emailController.text,
                                    userPassword: passwordController.text,
                                    phoneNumber: phoneNumberController.text,
                                    userName: nameController.text,
                                    userProfession: selectedProfession,
                                  );
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(SignUpButtonClicked(userModel: userModel));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      customSnackbar(context, true, 'Please provide all credentials'));
                                }
                              },
                              radius: 20,
                              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                                builder: (context, state) {
                                  if (state is SignUpLoading) {
                                    return const CircularProgressIndicator();
                                  }
                                  return Text(
                                    'Sign Up',
                                    style: theme.textTheme.titleLarge,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Navigate to Sign In
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account?', style: theme.textTheme.bodySmall),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                                  },
                                  child: const Text("Sign In"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
