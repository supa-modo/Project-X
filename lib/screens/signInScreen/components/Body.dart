import 'package:flutter/material.dart';
import 'package:project_x/screens/otpVerificationScreen/otpverification.dart';
import 'package:project_x/screens/signUpScreen/SignUpScreen.dart';

import '../../../constants.dart';
import '../../../extra components/defaultButton.dart';
import 'SignInForm.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        // padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // SizedBox(height: SizeConfig.screenHeight! * 0.0005),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 60,
                child: Image.asset("assets/images/logo.jpeg"),
              ),
              const SizedBox(height: 15),
              const Text(
                "Welcome Back",
                style: headingStyle,
              ),
              const SizedBox(height: 10),
              const Text(
                "Login with your registered email and password to continue",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SignInForm(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    // TODO : Add a new screen for phone number sign in
                    child: const Text(
                      "Login with phone number",
                      style: TextStyle(color: textButtonColor, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {},
                    // TODO : Add a new screen for phone number sign in
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: textButtonColor, fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 78),
                child: DefaultButton(
                    text: "Sign In",
                    pressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtpVerification()));
                    }),
              ),
              const SizedBox(height: 25),
              const NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: 14),
        ),
        GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen())),
            child: const Text(
              "Sign Up ",
              style: TextStyle(fontSize: 14, color: textButtonColor),
            ))
      ],
    );
  }
}