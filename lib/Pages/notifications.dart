import 'package:flutter/material.dart';
import 'package:furniture_app_ui/widgets/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppBar(
        prefixOnTap: () {
          Navigator.pop(context);
        },
        title: "Notifications",
        backgroundColor: Colors.white,
        iconColor: const Color(0xff808080),
        textColor: Colors.black,
        prefixIcon: Icons.arrow_back_ios_new_rounded,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            UpperNotificationContainers(
                bgColor: const Color(0xFFF0F0F0),
                size: size,
                majorText: 'Your order #123456789 has been confirmed',
                descriptionText:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ',
                image: "images/stand.jpeg"),
            UpperNotificationContainers(
                bgColor: Colors.white,
                size: size,
                majorText: 'Your order #123456789 has been canceled',
                descriptionText:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ',
                image: "images/lamp.jpeg"),
            Container(
              height: size.height * 0.116995074,
              color: const Color(0xFFF0F0F0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text("Discover hot sale furnitures this week.",
                        style: GoogleFonts.nunitoSans(
                          color: const Color(0xFF303030),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(height: 5),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.nunitoSans(
                          color: const Color(0xFF808080),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
              ),
            ),
            UpperNotificationContainers(
                bgColor: Colors.white,
                size: size,
                majorText:
                    'Your order #123456789 has been shipped successfully',
                descriptionText:
                    'Please help us to confirm and rate your order to get 10% discount code for next order.',
                image: "images/coffeetable.jpeg"),
            const Divider(),
            UpperNotificationContainers(
                bgColor: Colors.white,
                size: size,
                majorText: 'Your order #123456789 has been confirmed',
                descriptionText:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ',
                image: "images/coffeetable.jpeg"),
            const Divider(),
            UpperNotificationContainers(
                bgColor: Colors.white,
                size: size,
                majorText:
                    'Your order #123456789 has been shipped successfully',
                descriptionText:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ',
                image: "images/desk.jpeg"),
            const Divider(),
            UpperNotificationContainers(
                bgColor: Colors.white,
                size: size,
                majorText: 'Your order #123456789 has been canceled',
                descriptionText:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ',
                image: "images/stand.jpeg"),
          ],
        ),
      ),
    );
  }
}

class UpperNotificationContainers extends StatelessWidget {
  const UpperNotificationContainers({
    super.key,
    required this.size,
    required this.image,
    required this.majorText,
    required this.descriptionText,
    required this.bgColor,
  });

  final Size size;
  final String image, majorText, descriptionText;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.116995074,
      width: size.width,
      decoration: BoxDecoration(color: bgColor),
      child: Row(
        children: [
          const SizedBox(width: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12), // Apply BorderRadius here
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(majorText,
                  style: GoogleFonts.nunitoSans(
                    color: const Color(0xFF303030),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 5),
              SizedBox(
                width: 255,
                child: Text(descriptionText,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF808080),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
