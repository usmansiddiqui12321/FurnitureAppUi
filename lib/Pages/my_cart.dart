import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/check_out.dart';
import 'package:furniture_app_ui/Pages/product_detail.dart';

import 'package:furniture_app_ui/models/products.dart';
import 'package:furniture_app_ui/widgets/custom_appbar.dart';
import 'package:furniture_app_ui/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        prefixOnTap: () {
          Navigator.pop(context);
        },
        title: "My Cart",
        backgroundColor: Colors.white,
        iconColor: const Color(0xff808080),
        textColor: Colors.black,
        prefixIcon: Icons.arrow_back_ios_new_rounded,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              String image = demo_products[index].picture.toString();
              String price = demo_products[index].price.toString();
              String title = demo_products[index].title.toString();

              return ImagesWithTitle(
                image: image,
                title: title,
                price: price,
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: PromoCodeBar(),
        ),
        const SizedBox(height: 20),
        const TotalPrice(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CheckOutPage()));
              },
              title: "Check Out",
              height: 60,
              width: MediaQuery.sizeOf(context).width),
        ),
        const SizedBox(
          height: 30,
        )
      ]),
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Total:',
            style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 20,
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          Text('\$ 95.00',
              textAlign: TextAlign.right,
              style: GoogleFonts.nunitoSans(
                color: const Color(0xFF303030),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 0,
              ))
        ],
      ),
    );
  }
}

class PromoCodeBar extends StatelessWidget {
  const PromoCodeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.sizeOf(context).width * .8,
          height: 44,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topLeft: Radius.circular(12)),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x338A959E),
                blurRadius: 40,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: Text('Enter your promo code',
                style: GoogleFonts.nunitoSans(
                  color: const Color(0xFF303030),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 0,
                )),
          ),
        ),
        SizedBox(
          width: 44,
          height: 44,
          child: Container(
            width: 44,
            height: 44,
            decoration: ShapeDecoration(
              color: const Color(0xFF303030),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class ImagesWithTitle extends StatelessWidget {
  const ImagesWithTitle({
    super.key,
    required this.image,
    required this.price,
    required this.title,
  });

  final String image;
  final String price;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    // Use ClipRRect to apply the BorderRadius to the Image
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: AssetImage(image),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(title,
                              style: GoogleFonts.nunitoSans(
                                color: const Color(0xFF5F5F5F),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0,
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: AddSubRow(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.cancel_outlined),
                      Text('\$ $price',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.nunitoSans(
                            color: const Color(0xFF303030),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ))
                    ],
                  ))
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: Color(0xffF0F0F0),
            thickness: 2,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
