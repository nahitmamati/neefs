import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:neefs/features/user/presentation/cubit/obs_cubit.dart';
import 'package:neefs/features/user/presentation/cubit/user_cubit.dart';
import 'package:neefs/injection_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoginSuccessfull) {
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              content: Text(
                "Login successfull!",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )));
        } else if (state is UserLoading) {
          EasyLoading.show();
        } else if (state is UserLoginFailed) {
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              content: Text(
                state.failure.message!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              )));
        } else if (state is UserLoginValidationFailed) {
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
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
                            color:
                                Theme.of(context).colorScheme.onPrimaryContainer,
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
                                  fontWeight: FontWeight.bold,
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
                  child: Form(
                    key:
                        getIt<GlobalKey<FormState>>(instanceName: 'loginFormKey'),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16, top: 45, bottom: 10),
                          child: TextFormField(
                            controller: getIt<TextEditingController>(
                                instanceName: 'emailController'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email.';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return 'Invalid email';
                              }
                              return null;
                            },
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
                          child: BlocBuilder<ObsCubit, bool>(
                            builder: (context, state) {
                              return TextFormField(
                                controller: getIt<TextEditingController>(
                                    instanceName: 'passwordController'),
                                obscureText: state,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password.';
                                  } else if (value.trim().length < 6) {
                                    return 'Password cannot be less than 6 characters.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      context
                                          .read<ObsCubit>()
                                          .showPassword(!state);
                                    },
                                    icon: state
                                        ? const Icon(
                                            Icons.visibility_off_outlined)
                                        : const Icon(
                                            Icons.remove_red_eye_outlined),
                                  ),
                                ),
                              );
                            },
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
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          height: 50,
                          child: FilledButton(
                            onPressed: () async {
                              TextEditingController emailController =
                                  await getIt<TextEditingController>(
                                      instanceName: 'emailController');

                              TextEditingController passwordController =
                                  await getIt<TextEditingController>(
                                      instanceName: 'passwordController');
                              context.read<UserCubit>().login(
                                  emailController.text, passwordController.text);
                            },
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
                                GoRouter.of(context).go('/login/register');
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
