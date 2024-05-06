import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/auth/signup.dart';
import 'package:flutter_basic/pages/home.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Please Log-In"),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: const Text(
                        'Log-in',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      )),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        //hintText: 'Input your Email here',
                        labelText: 'Email *',
                        border: InputBorder.none,
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Email can not be empty!";
                        }
                        return null;
                        // return (value != null && value.value)
                        //     ? 'Do not use the @ char.'
                        //     : null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        //hintText: 'Enter your password',
                        labelText: 'Password *',
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.length >= 6)
                            ? null
                            : 'Password must be at least 6 characters long.';
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue.shade300,
                        // border: Border.all(width: 6, color: Colors.cyan),
                      ),
                      height: 48,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        "Sign-In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          ); // Navigate to the sign-up screen
                        },
                        child: const Text(" Sign Up"),
                      ),
                    ],
                  ),
              //  const SpinKitFadingCircle(
              //     color: Colors.blue,
              //     duration: Duration(milliseconds: 1500),
              //     size: 40,
              //   )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
