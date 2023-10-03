import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/success.dart';
import 'package:furniture_app_ui/widgets/custom_appbar.dart';
import 'package:furniture_app_ui/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: "CHECK-OUT",
        backgroundColor: Colors.white,
        iconColor: const Color(0xff808080),
        textColor: Colors.black,
        prefixIcon: Icons.arrow_back_ios_new_rounded,
        prefixOnTap: () {
          Navigator.pop(context);
        },
        postfixIcon: Icons.shopping_cart_outlined,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const TitleAndEditButton(title: "Shipping Address"),
              const SizedBox(height: 15),
              NameAndAddress(size: size),
              const SizedBox(height: 30),
              const TitleAndEditButton(title: "Payment"),
              const SizedBox(height: 15),
              Payment(size: size),
              const SizedBox(height: 30),
              Pricing(size: size),
              const SizedBox(height: 30),
              CustomButton(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessPage(),
                        ));
                  },
                  title: "Submit Your Order",
                  height: 60,
                  width: size.width)
            ],
          ),
        ),
      ),
    );
  }
}

class Pricing extends StatelessWidget {
  const Pricing({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.1908,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x338A959E),
            blurRadius: 40,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            KeyAndValue(
              title: "Order",
              value: " \$ 95.00",
            ),
            SizedBox(height: 20),
            KeyAndValue(
              title: "Delivery",
              value: " \$ 5.00",
            ),
            SizedBox(height: 20),
            KeyAndValue(
              title: "Total",
              value: " \$ 100.00",
            ),
          ],
        ),
      ),
    );
  }
}

class KeyAndValue extends StatelessWidget {
  final String title, value;

  const KeyAndValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.nunitoSans(
              color: const Color(0xFF909090),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            )),
        const SizedBox(width: 20),
        Text(value,
            style: GoogleFonts.nunitoSans(
              color: const Color(0xFF303030),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}

class Payment extends StatelessWidget {
  const Payment({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 68,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x338A959E),
            blurRadius: 40,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Container(
            width: 64,
            height: 38,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadows: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 25,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Image(image: AssetImage("images/mastercard.png")),
          ),
          const SizedBox(width: 16),
          Text("**** **** **** 3947",
              style: GoogleFonts.nunitoSans(
                  color: const Color(0xFF303030),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  height: 0.3,
                  letterSpacing: -.15)),
        ],
      ),
    );
  }
}

class NameAndAddress extends StatelessWidget {
  const NameAndAddress({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: 127,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x338A959E),
              blurRadius: 40,
              offset: Offset(0, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text("Bruno Fernandes",
                  style: GoogleFonts.nunitoSans(
                    color: const Color(0xFF303030),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  )),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "25 rue Robert Latouche, Nice, 06200, Côte\n D’azur, France",
                  style: GoogleFonts.nunitoSans(
                    color: const Color(0xFF808080),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ));
  }
}

class TitleAndEditButton extends StatelessWidget {
  final String title;
  const TitleAndEditButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.nunitoSans(
              color: const Color(0xFF808080),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 0,
            )),
        const Icon(
          Icons.edit,
          color: Color(0xFF808080),
        )
      ],
    );
  }
}
