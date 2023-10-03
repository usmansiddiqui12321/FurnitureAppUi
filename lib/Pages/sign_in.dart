import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/homepage.dart';
import 'package:furniture_app_ui/Pages/master_page.dart';
import 'package:furniture_app_ui/Pages/sign_up.dart';
import 'package:furniture_app_ui/widgets/custom_button.dart';
import 'package:furniture_app_ui/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              height: size.height * .5384,
              //67.733 for signup
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
                    title: "Email",
                    ispass: false,
                  ),
                  const SizedBox(height: 30),
                  const CustomTextField(
                    title: "Password",
                    ispass: true,
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Forgot Password',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF303030),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    title: "SIGN IN",
                      height: 50,
        width: 285,
                    ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const MasterPage()));
                    },
                  ),
                  const SizedBox(height: 35),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                    child: Text(
                      'SIGN UP',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunitoSans(
                        color: const Color(0xFF303030),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
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
                text: 'Hello !\n',
                style: GoogleFonts.merriweather(
                  color: const Color(0xFF909090),
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                )),
            TextSpan(
                text: 'WELCOME BACK',
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
