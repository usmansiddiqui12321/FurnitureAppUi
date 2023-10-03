import 'package:flutter/material.dart';
import 'package:furniture_app_ui/widgets/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  @override
  Widget build(BuildContext context) {
    bool checkedfalse = false;
    bool checkedtrue = true;

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              CheckboxHeading(isChecked: checkedtrue),
              const SizedBox(height: 15),
              NameAndAddress(size: size),
              const SizedBox(height: 25),
              CheckboxHeading(isChecked: checkedfalse),
              const SizedBox(height: 15),
              NameAndAddress(size: size),
              const SizedBox(height: 25),
              CheckboxHeading(isChecked: checkedfalse),
              const SizedBox(height: 15),
              NameAndAddress(size: size),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckboxHeading extends StatelessWidget {
  const CheckboxHeading({
    super.key,
    required this.isChecked,
  });

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckbox(),
        const SizedBox(width: 15),
        Text("Use as the shipping address",
            style: GoogleFonts.nunitoSans(
              color: const Color(0xFF808080),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            )),
      ],
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

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: isChecked ? const Color(0xFF303030) : null,
          border: Border.all(
            color: isChecked ? const Color(0xFF303030) : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: isChecked
            ? const Icon(
                Icons.check,
                size: 15,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
