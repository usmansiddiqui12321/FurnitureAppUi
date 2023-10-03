import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/sign_in.dart';
import 'package:furniture_app_ui/widgets/custom_button.dart';
import 'package:furniture_app_ui/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Tablewithsidebars(),
            const SizedBox(height: 30),
            const Headings(),
            const SizedBox(height: 25),
            Container(
              width: size.width * .92,
              height: size.height * .67733,
              //.67733 for signupScreen
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x338A959E),
                    blurRadius: 30,
                    offset: Offset(0, 7),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  const CustomTextField(
                    title: "Name",
                    ispass: false,
                  ),
                  const SizedBox(height: 30),
                  const CustomTextField(
                    title: "Email",
                    ispass: false,
                  ),
                  const SizedBox(height: 30),
                  const CustomTextField(
                    title: "Password",
                    ispass: true,
                  ),
                  const SizedBox(height: 30),
                  const CustomTextField(
                    title: "Confirm Password",
                    ispass: true,
                  ),
                  const SizedBox(height: 35),
                  const CustomButton(
                    title: "SIGN UP",
                    height: 50,
                    width: 285,
                  ),
                  const SizedBox(height: 35),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()));
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have account? ',
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 14,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'SIGN IN',
                            style: TextStyle(
                              color: Color(0xFF303030),
                              fontSize: 14,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Headings extends StatelessWidget {
  const Headings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: 'WELCOME',
                style: GoogleFonts.merriweather(
                  color: const Color(0xFF303030),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
      ),
    );
  }
}

class Tablewithsidebars extends StatelessWidget {
  const Tablewithsidebars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Bar(),
        SizedBox(width: 10),
        Image(image: AssetImage("images/table.jpg")),
        SizedBox(width: 10),
        Bar()
      ],
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 1,
      decoration: ShapeDecoration(
        color: const Color(0xFFBDBDBD),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),
    );
  }
}
