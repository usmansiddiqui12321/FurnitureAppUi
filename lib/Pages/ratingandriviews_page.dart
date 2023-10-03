import 'package:flutter/material.dart';
import 'package:furniture_app_ui/widgets/custom_appbar.dart';
import 'package:furniture_app_ui/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingAndReviewPage extends StatefulWidget {
  final String? image, name, rating, riview;
  const RatingAndReviewPage(
      {super.key,
      required this.image,
      required this.name,
      required this.rating,
      required this.riview});

  @override
  State<RatingAndReviewPage> createState() => _RatingAndReviewPageState();
}

class _RatingAndReviewPageState extends State<RatingAndReviewPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: "RATING & REVIEW",
        backgroundColor: Colors.white,
        iconColor: const Color(0xff808080),
        textColor: Colors.black,
        prefixIcon: Icons.arrow_back_ios_new_rounded,
        prefixOnTap: () {
          Navigator.pop(context);
        },
        postfixIcon: Icons.shopping_cart_outlined,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 70,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomButton(
                title: "Write a Review", height: 50, width: size.width * .8),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageAndInfo(
                    image: widget.image.toString(),
                    name: widget.name.toString(),
                    rating: widget.rating.toString(),
                    riview: widget.riview.toString()),
                const SizedBox(height: 15),
                const Divider(),
                const SizedBox(height: 40),
                const ReviewContainerWithImage(
                  image: "images/profile.png",
                ),
                const SizedBox(height: 20),
                const ReviewContainerWithImage(
                  image: "images/profile.png",
                ),
                const SizedBox(height: 20),
                const ReviewContainerWithImage(
                  image: "images/profile.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewContainerWithImage extends StatelessWidget {
  const ReviewContainerWithImage({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: size.width,
            height: 240,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x338A959E),
                  blurRadius: 40,
                  offset: Offset(0, 8),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(height: 5),
                  const NameAndDate(),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffF2C94C)),
                      Icon(Icons.star, color: Color(0xffF2C94C)),
                      Icon(Icons.star, color: Color(0xffF2C94C)),
                      Icon(Icons.star, color: Color(0xffF2C94C)),
                      Icon(Icons.star, color: Color(0xffF2C94C)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                      'Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.nunitoSans(
                        color: const Color(0xFF5F5F5F),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      )),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          // top: -5, // Adjust the top position to -10 or as needed
          child: ClipOval(
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NameAndDate extends StatelessWidget {
  const NameAndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Bruno Fernandes",
            textAlign: TextAlign.justify,
            style: GoogleFonts.nunitoSans(
              color: const Color(0xFF5F5F5F),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 0,
            )),
        Text("20/03/2020",
            textAlign: TextAlign.justify,
            style: GoogleFonts.nunitoSans(
              color: const Color(0xFF5F5F5F),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 0,
            )),
      ],
    );
  }
}

class ImageAndInfo extends StatelessWidget {
  final String image, name, rating, riview;
  const ImageAndInfo(
      {super.key,
      required this.image,
      required this.name,
      required this.rating,
      required this.riview});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(image.toString()),
          height: 100,
          fit: BoxFit.fill,
          width: 100,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name.toString(),
                textAlign: TextAlign.justify,
                style: GoogleFonts.nunitoSans(
                  color: const Color(0xFF5F5F5F),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                )),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 20,
                  color: Color(0xffF2C94C),
                ),
                Text(
                  rating.toString(),
                  style: GoogleFonts.nunitoSans(
                    color: const Color(0xFF303030),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('($riview reviews)',
                style: GoogleFonts.nunitoSans(
                  color: const Color(0xFF303030),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ))
          ],
        )
      ],
    );
  }
}
