import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/ratingandriviews_page.dart';
import 'package:furniture_app_ui/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  final String image, title, riviews, price, description, rating;
  const ProductDetail(
      {super.key,
      required this.image,
      required this.title,
      required this.riviews,
      required this.price,
      required this.description,
      required this.rating});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    int price = int.parse(widget.price);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: size.width * .8,
                    height: 455,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(55)),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 27,
                  top: 150,
                  child: ContainerOnPicture(),
                ),
                const Positioned(
                  left: 30,
                  top: 50,
                  child: CustomBackButton(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Text(
                widget.title,
                style: GoogleFonts.gelasio(
                  color: const Color(0xFF303030),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$ $price',
                    style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF303030),
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    )),
                const Padding(
                  padding: EdgeInsets.only(right: 25.0),
                  child: AddSubRow(),
                )
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RatingAndReviewPage(
                                name: widget.title.toString(),
                                rating: widget.rating.toString(),
                                riview: widget.riviews.toString(),
                                image: widget.image.toString(),
                              )));
                },
                child: RatingandRiviews(widget: widget)),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Text(widget.description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.nunitoSans(
                    color: const Color(0xFF5F5F5F),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    height: 0,
                  )),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                BookMarkButton(),
                SizedBox(width: 20),
                CustomButton(title: "Add to cart", height: 60, width: 250)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BookMarkButton extends StatelessWidget {
  const BookMarkButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.40,
      child: Container(
        width: 60,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xFFE0E0E0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Icon(
          Icons.bookmark_outline,
          color: Colors.black,
        ),
      ),
    );
  }
}

class RatingandRiviews extends StatelessWidget {
  const RatingandRiviews({
    super.key,
    required this.widget,
  });

  final ProductDetail widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffF2C94C),
        ),
        const SizedBox(width: 10),
        Text(
          widget.rating,
          style: GoogleFonts.nunitoSans(
            color: const Color(0xFF303030),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const SizedBox(width: 20),
        Text('(${widget.riviews} reviews)',
            style: GoogleFonts.nunitoSans(
              color: const Color(0xFF808080),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 0,
            ))
      ],
    );
  }
}

class AddSubRow extends StatefulWidget {
  const AddSubRow({
    super.key,
  });

  @override
  State<AddSubRow> createState() => _AddSubRowState();
}

class _AddSubRowState extends State<AddSubRow> {
  int count = 1;

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  void decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: incrementCount,
          child: const AddSubButton(
            icon: Icons.add,
          ),
        ),
        const SizedBox(width: 15),
        Text('$count',
            style: GoogleFonts.nunitoSans(
              color: const Color(0xFF303030),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 0.90,
            )),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: decrementCount,
          child: const AddSubButton(
            icon: Icons.remove,
          ),
        ),
      ],
    );
  }
}

class AddSubButton extends StatelessWidget {
  final IconData icon;
  const AddSubButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Opacity(
        opacity: 0.40,
        child: Container(
          width: 30,
          height: 30,
          decoration: ShapeDecoration(
            color: const Color(0xFFE0E0E0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x338A959E),
                      blurRadius: 40,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Icon(Icons.arrow_back_ios_new_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerOnPicture extends StatelessWidget {
  const ContainerOnPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 192,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x338A959E),
            blurRadius: 40,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 15),
          CustomCircles(
            minor: Color(0xFF909090),
            major: Colors.white,
          ),
          SizedBox(height: 15),
          CustomCircles(
            minor: Color(0xFFF0F0F0),
            major: Color(0xFFB4916C),
          ),
          SizedBox(height: 15),
          CustomCircles(
            minor: Color(0xFFF0F0F0),
            major: Color(0xFFE4CBAD),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class CustomCircles extends StatelessWidget {
  final Color major, minor;
  const CustomCircles({
    super.key,
    required this.major,
    required this.minor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34,
      height: 34,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 34,
              height: 34,
              decoration: ShapeDecoration(
                color: minor,
                shape: const OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 5,
            top: 5,
            child: Container(
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                color: major,
                shape: const OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
