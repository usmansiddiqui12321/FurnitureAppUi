import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/master_page.dart';
import 'package:furniture_app_ui/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 80),
        Center(
          child: Text("Success",
              style: GoogleFonts.merriweather(
                color: const Color(0xFF303030),
                fontSize: 36,
                fontWeight: FontWeight.w700,
                height: 0 / 03,
              )),
        ),
        const SizedBox(height: 30),
        const FlowerAndTable(),
        const SizedBox(height: 20),
        Text(
            "Your order will be delivered soon.\nThank you for choosing our app!",
            style: GoogleFonts.nunitoSans(
              color: const Color(0xFF5F5F5F),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              height: 0,
            )),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomButton(
              title: "TRACK YOUR ORDERS", height: 60, width: size.width),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MasterPage()));
            },
            child: Container(
              width: size.width,
              height: 60,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text("BACK TO HOME",
                    style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF5F5F5F),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    )),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class FlowerAndTable extends StatelessWidget {
  const FlowerAndTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Image(image: AssetImage("images/background.png")),
          ),
          Image(
            image: AssetImage("images/flowertable.png"),
            height: 170,
            width: 170,
          ),
          Positioned(
            bottom: -50,
            child: Image(
              image: AssetImage("images/greencheck.jpg"),
              height: 170,
              width: 170,
            ),
          ),
        ],
      ),
    );
  }
}
