import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool pw = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 25,
            child: Stack(
              children: [
                SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                    )),
                Positioned(
                  bottom: 1,
                  right: -20,
                  child: Container(
                    width: 900,
                    height: 900,
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(0.4),
                        borderRadius: BorderRadius.circular(400)),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 120,
                  child: Container(
                    width: 600,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      borderRadius: BorderRadius.circular(400),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Sign in to your\nAccount",
                        style: TextStyle(
                            fontSize: 32,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      Text(
                        "Sign in to your Account",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 75,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16, top: 45, bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16, top: 10, bottom: 5),
                  child: TextField(
                    obscureText: pw,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          pw = !pw;
                          setState(() {});
                        },
                        icon: pw
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // GoRouter.of(context).push("/register");
                      },
                      child: Text(
                        "Register",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
