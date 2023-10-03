import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/my_orders.dart';
import 'package:furniture_app_ui/Pages/shipping_address.dart';
import 'package:furniture_app_ui/widgets/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Profile",
        backgroundColor: Colors.white,
        iconColor: Colors.black,
        textColor: Colors.black,
        prefixIcon: Icons.search_sharp,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const UserInfoRow(),
              const SizedBox(height: 30),
               ProfileOptions(
                onTap: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyOrders(),
                      ));
                },
                major: 'My orders',
                minor: 'Already have 10 orders',
              ),
              const SizedBox(
                height: 15,
              ),
              ProfileOptions(
                major: 'Shipping Addresses',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShippingAddress(),
                      ));
                },
                minor: '03 Addresses',
              ),
              const SizedBox(
                height: 15,
              ),
              const ProfileOptions(
                major: 'Payment Method',
                minor: 'Reviews for 5 items',
              ),
              const SizedBox(
                height: 15,
              ),
              const ProfileOptions(
                major: 'Help Center',
                minor: 'FAQ Questions',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOptions extends StatelessWidget {
  final void Function()? onTap;
  final String major, minor;
  const ProfileOptions({
    super.key,
    required this.major,
    required this.minor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x338A959E),
              blurRadius: 40,
              offset: Offset(0, 7),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  Text(major,
                      style: GoogleFonts.nunitoSans(
                        color: const Color(0xFF303030),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      )),
                  const SizedBox(height: 5),
                  Text(minor,
                      style: GoogleFonts.nunitoSans(
                        color: const Color(0xFF808080),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ))
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("images/profile.png"),
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bruno Fernandes',
                    style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF303030),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    )),
                Text('Bruno Fernandes',
                    style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF808080),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    )),
              ],
            )
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.mode_edit_rounded))
      ],
    );
  }
}
