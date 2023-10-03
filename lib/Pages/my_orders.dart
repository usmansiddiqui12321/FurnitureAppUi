import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text(
            "My Orders",
            style: GoogleFonts.merriweather(
              color: const Color(0xFF303030),
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          bottom: TabBar(
            labelColor: const Color(0xFF303030),
            labelStyle: GoogleFonts.nunitoSans(
              color: const Color(0xFF303030),
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
            unselectedLabelStyle: GoogleFonts.nunitoSans(
              color: const Color(0xFF909090),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
            indicatorColor: Colors.black,
            controller: controller,
            tabs: const [
              Tab(
                text: 'Delivered',
              ),
              Tab(
                text: 'Processing',
              ),
              Tab(
                text: 'Canceled',
              ),
            ],
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: const BoxDecoration(
              shape: BoxShape.rectangle,

              // Customize the indicator
              border: Border(
                bottom: BorderSide(
                  color: Colors.black, // Color of the underline
                  width: 3.0, // Thickness of the underline
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const [
            // Content for the "Delivered" tab
            DeliveredTabContent(), // Content for the "Processing" tab
            Center(
              child: Text('Processing Tab Content'),
            ),
            // Content for the "Canceled" tab
            Center(
              child: Text('Canceled Tab Content'),
            ),
          ],
        ));
  }
}

class DeliveredTabContent extends StatelessWidget {
  const DeliveredTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            OrderBox(size: size),
            const SizedBox(height: 25),
            OrderBox(size: size),
            const SizedBox(height: 25),
            OrderBox(size: size),
            const SizedBox(height: 25),
            OrderBox(size: size),
          ],
        ),
      ),
    );
  }
}

class OrderBox extends StatelessWidget {
  const OrderBox({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .22,
      width: size.width,
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
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order No238562312",
                  style: GoogleFonts.nunitoSans(
                    color: const Color(0xFF303030),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Text(
                  "20/03/2020",
                  style: GoogleFonts.nunitoSans(
                    color: const Color(0xFF909090),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Quantity: ',
                        style: GoogleFonts.nunitoSans(
                          color: const Color(0xFF909090),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: '03',
                        style: GoogleFonts.nunitoSans(
                          color: const Color(0xFF303030),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total Amount: ',
                        style: GoogleFonts.nunitoSans(
                          color: const Color(0xFF909090),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: '\$150',
                        style: GoogleFonts.nunitoSans(
                          color: const Color(0xFF303030),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 36,
                decoration: const ShapeDecoration(
                  color: Color(0xFF303030),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
                child: Center(
                  child: Text('Detail',
                      style: GoogleFonts.nunitoSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text('Detail',
                    style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF27AE60),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
