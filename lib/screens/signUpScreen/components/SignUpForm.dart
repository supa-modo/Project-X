// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../extra components/defaultButton.dart';
import '../../otpVerificationScreen/otpverification.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _nameField = TextEditingController();
  final TextEditingController _phoneNumberField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final TextEditingController _confirmPasswordField = TextEditingController();

  final formKey = GlobalKey<FormState>();
  late String name, phoneNumber, email;
  late String password;
  late String confirmPassword;
  bool _isOperator = false;
  bool _isPassenger = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(height: 48, child: emailFormField()),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(height: 48, child: nameFormField()),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(height: 48, child: phoneNumberFormField()),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(height: 48, child: passwordFormField()),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(height: 48, child: confirmPasswordFormField()),
          ),
          const SizedBox(height: 5),
          const Text(
            "Sign up as:",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: <Widget>[
                Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  value: _isOperator,
                  onChanged: (value) {
                    setState(() {
                      _isOperator = value!;
                      _isPassenger = !value;
                    });
                  },
                ),
                const Text("Operator"),
                SizedBox(width: 50),
                Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  value: _isPassenger,
                  onChanged: (value) {
                    setState(() {
                      _isPassenger = value!;
                      _isOperator = !value;
                    });
                  },
                ),
                const Text("Passenger"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "By pressing the Sign Up button you agree to our terms and conditions",
            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 78),
            child: DefaultButton(
                text: "Sign Up",
                pressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   return;
                  // }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OtpVerification()));
                }),
          ),
        ],
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      controller: _emailField,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter an email";
        }
        if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return "Please Enter a valid Email";
        }
        return null;
      },
      onSaved: (newValue) => email = newValue!,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 22, 22, 22),
            fontWeight: FontWeight.bold),
        hintStyle: const TextStyle(fontSize: 13),
        labelText: "Email",
        hintText: "Enter Your Email address",
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: appPrimaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: appPrimaryColor)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField nameFormField() {
    return TextFormField(
        controller: _nameField,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter a name";
          }
          return null;
        },
        onSaved: (newValue) => name = newValue!,
        decoration: InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red)),
          labelStyle: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 22, 22, 22),
              fontWeight: FontWeight.bold),
          hintStyle: const TextStyle(fontSize: 13),
          labelText: "Name",
          hintText: "Enter Your Name",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }

  TextFormField phoneNumberFormField() {
    return TextFormField(
        controller: _phoneNumberField,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        onSaved: (newValue) => phoneNumber = newValue!,
        decoration: InputDecoration(
          labelStyle: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 22, 22, 22),
              fontWeight: FontWeight.bold),
          hintStyle: const TextStyle(fontSize: 13),
          labelText: "Phone Number",
          hintText: "Enter Your Phone Number",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }

  TextFormField passwordFormField() {
    return TextFormField(
        controller: _passwordField,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        textInputAction: TextInputAction.next,
        onSaved: (newValue) => password = newValue!,
        decoration: InputDecoration(
          labelStyle: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 22, 22, 22),
              fontWeight: FontWeight.bold),
          hintStyle: const TextStyle(fontSize: 13),
          labelText: "Password",
          hintText: "Enter Your Preferred Password",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }

  TextFormField confirmPasswordFormField() {
    return TextFormField(
        controller: _confirmPasswordField,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        textInputAction: TextInputAction.done,
        onSaved: (newValue) => confirmPassword = newValue!,
        decoration: InputDecoration(
          labelStyle: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 22, 22, 22),
              fontWeight: FontWeight.bold),
          hintStyle: const TextStyle(fontSize: 13),
          labelText: "Confirm Your Password",
          hintText: "Re-enter your Password",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }
}
