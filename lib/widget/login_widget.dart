import 'package:bloc_learn/bloc/auth_bloc.dart';
import 'package:bloc_learn/homepage.dart';
import 'package:bloc_learn/todo.dart';
import 'package:bloc_learn/widget/textfiellogin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          setState(() {
            
          }); 
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errror)));
        }
        if (state is AuthSuccess) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            top: false,
            child: Container(
              color: Color(0xFF0818A8),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  // Text("Login Page"),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back",
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Email", style: TextStyle(color: Colors.black)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Textfieldlogin(
                                textController: emailController,
                                isPass: false,
                                icon: Icons.email,
                                type: TextInputType.text,
                                hintText: "Fill Email"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Password",
                              style: TextStyle(color: Colors.black)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Textfieldlogin(
                                textController: passwordController,
                                isPass: true,
                                icon: Icons.lock,
                                type: TextInputType.text,
                                hintText: "Fill Password"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Forgot Password?",
                                  style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(SignIn(
                                    emailController.text,
                                    passwordController.text));
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Color(0xFF0818A8),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Login",
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text("Or Login With"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {},
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                      "assets/icons/googlelogo.png"),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                    "assets/icons/facebooklogo.png"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => Signup()),
                                  // );
                                },
                                child: Text(
                                  " Sign Up",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(46.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .25,
                      child: Image.asset(
                        "assets/images/loginlogo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
