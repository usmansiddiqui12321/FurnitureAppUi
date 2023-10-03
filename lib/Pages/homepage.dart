import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/product_detail.dart';
import 'package:furniture_app_ui/models/products.dart';
import 'package:furniture_app_ui/widgets/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> categories = [
    'Popular',
    'Chair',
    'Table',
    "Armchair",
    "Bed",
    "Lamb",
  ]; // Define your categories
  List<IconData> iconsList = [
    Icons.star,
    Icons.chair_outlined,
    Icons.table_restaurant_outlined,
    Icons.chair_outlined,
    Icons.bed_outlined,
    Icons.sim_card_alert
  ];
  String selectedCategory = 'Popular'; // Initially, select the first category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Make Home Beautiful",
        backgroundColor: Colors.white,
        iconColor: Color(0xff808080),
        textColor: Colors.black,
        prefixIcon: Icons.arrow_back_ios_new_rounded,
        postfixIcon: Icons.shopping_cart_outlined,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryContainer(
                      onTap: () {
                        selectedCategory = categories[index];
                        setState(() {});
                      },
                      name: categories[index],
                      icon: iconsList[index],
                      isSelected: categories[index] ==
                          selectedCategory, // Check if the category is selected
                    );
                  },
                ),
              ),
              // const SizedBox(height: 10),
              Expanded(
                flex: 6,
                child: GridView.builder(
                  itemCount: demo_products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items per row
                  ),
                  itemBuilder: (context, index) {
                    return ProductsInfo(
                      price: demo_products[index].price.toString(),
                      image: demo_products[index].picture.toString(),
                      title: demo_products[index].title.toString(),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                  price: demo_products[index].price.toString(),
                                  image:
                                      demo_products[index].picture.toString(),
                                  title: demo_products[index].title.toString(),
                                  riviews:
                                      demo_products[index].reviews.toString(),
                                  description: demo_products[index]
                                      .description
                                      .toString(),
                                  rating:
                                      demo_products[index].rating.toString()),
                            ));
                      },
                    ); // Replace with your grid item widget
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductsInfo extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final void Function()? ontap;
  const ProductsInfo({
    super.key,
    required this.image,
    required this.ontap,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: SizedBox(
        height: size.height * .5,
        width: size.width * .4,
        child: GestureDetector(
          onTap: ontap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: size.width * .393,
                    height: size.height * .12,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                  const ShoppingBagButton(),
                ],
              ),
              const SizedBox(height: 10),
              Flexible(
                child: Text(
                  title,
                  style: GoogleFonts.nunitoSans(
                    color: const Color(0xFF5F5F5F),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  '\$ $price',
                  style: GoogleFonts.nunitoSans(
                    color: const Color(0xFF303030),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShoppingBagButton extends StatelessWidget {
  const ShoppingBagButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.40,
      child: Container(
        width: 25,
        height: 25,
        decoration: ShapeDecoration(
          color: const Color(0xFF5F5F5F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Center(
          // Center the IconButton
          child: Icon(
            Icons.shopping_bag,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool isSelected; // Add isSelected property
  final void Function()? onTap;
  const CategoryContainer({
    super.key,
    required this.name,
    required this.icon,
    required this.isSelected,
    this.onTap, // Initialize isSelected property
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(children: [
          Container(
            height: 44,
            width: 44,
            decoration: ShapeDecoration(
              color: isSelected
                  ? const Color(0xFF303030)
                  : const Color(0xFFF0F0F0), // Set color based on isSelected
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Icon(
              icon,
              color: isSelected
                  ? Colors.white
                  : Colors.black, // Change icon color as needed
            ),
          ),
          Text(name,
              style: GoogleFonts.nunitoSans(
                color: const Color(
                    0xFF303030), // Set text color based on isSelected
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 0,
              ))
        ]),
      ),
    );
  }
}
