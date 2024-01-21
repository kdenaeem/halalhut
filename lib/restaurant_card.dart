import 'package:flutter/material.dart';
import 'package:halalhut/model/restaurant.dart';
import 'package:halalhut/styles/typo.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard(
      {this.imageAspectRatio = 33 / 49, required this.restaurant, Key? key})
      : assert(imageAspectRatio > 0),
        super(key: key);

  final double imageAspectRatio;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final imageWidget = Image.asset(
      restaurant.assetName,
      fit: BoxFit.cover,
    );

    return Container(
      width: 210,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipPath(
              clipper: RoundedTopClipper(),
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        50), // Adjust the radius as per your requirement
                  ),
                  child: Image.asset(
                    width: 200,
                    'assets/${restaurant.name}-i.png',
                    height: 250,
                    fit: BoxFit.cover,
                  )),
            ),
            // Image.asset(
            //   'assets/modern.png',
            //   height: 250,
            // ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  restaurant.name,
                  style: product,
                ),
                Spacer(),
                Row(
                  children: [
                    Image.asset(
                      'assets/star.png',
                      height: 20,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '5.0',
                      style: produrct,
                    )
                  ],
                )
              ],
            )
          ]),
    );
  }
}

class RoundedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 20)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 20)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
