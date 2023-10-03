import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/my_cart.dart';
import 'package:furniture_app_ui/models/products.dart';
import 'package:furniture_app_ui/widgets/custom_appbar.dart';
import 'package:furniture_app_ui/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Favorite",
        backgroundColor: Colors.white,
        iconColor: Color(0xff808080),
        textColor: Colors.black,
        prefixIcon: Icons.search_rounded,
        postfixIcon: Icons.shopping_cart_outlined,
      ),
      body: Stack(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: demo_products.length,
              itemBuilder: (context, index) {
                String image = demo_products[index].picture.toString();
                String title = demo_products[index].title.toString();
                String price = demo_products[index].price.toString();

                return ImagesWithTitle(
                  image: image,
                  title: title,
                  price: price,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyCart(),
                          ));
                    },
                    title: "Add all to my cart",
                    height: 50,
                    width: size.width)),
          )
        ],
      ),
    );
  }
}

class ImagesWithTitle extends StatelessWidget {
  const ImagesWithTitle({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  final String image, title, price;

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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(title,
                            style: GoogleFonts.nunitoSans(
                              color: const Color(0xFF5F5F5F),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            )),
                        const SizedBox(height: 5),
                        Text('\$ $price',
                            style: GoogleFonts.nunitoSans(
                              color: const Color(0xFF303030),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ))
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
                      Container(
                        width: 34,
                        height: 34,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE0E0E0).withOpacity(.40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Icon(
                          Icons.shopping_bag_rounded,
                          color: Color(0xff303030),
                        ),
                      )
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
