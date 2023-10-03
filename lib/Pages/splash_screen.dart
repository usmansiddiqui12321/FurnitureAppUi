import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Container(
            width: size.width, // Set the width to screen width
            height: size.height, // Set the height to screen height
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/pic_one.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * .28),
                  Text(
                    'Make Your',
                    style: GoogleFonts.gelasio(
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Home Beautiful',
                    style: GoogleFonts.gelasio(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        style: GoogleFonts.nunitoSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(.5))
                            .copyWith(fontWeight: FontWeight.w400, height: 2),
                        maxLines: 3,
                        "The best simple place where you discover most wonderful furnitures and make your home beautiful"),
                  ),
                  SizedBox(
                    height: size.height * .13,
                  ),
                  const GetStartedButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignIn(),
              ));
        },
        child: Container(
          width: 159,
          height: 54,
          decoration: ShapeDecoration(
            color: const Color(0xFF212121),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            shadows: const [
              BoxShadow(
                color: Color(0x4C303030),
                blurRadius: 30,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: Text('Get Started',
                textAlign: TextAlign.center,
                style: GoogleFonts.gelasio(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
