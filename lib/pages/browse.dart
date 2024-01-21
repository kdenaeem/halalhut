// import 'dart';

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:halalhut/model/restaurant.dart';
import 'package:halalhut/model/restaurant_repo.dart';
import 'package:halalhut/restaurant_card.dart';
import 'package:halalhut/styles/buttons.dart';
import 'package:halalhut/styles/colors.dart';
import 'package:halalhut/styles/typo.dart';

class BrowseHut extends StatelessWidget {
  const BrowseHut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Restaurant> restaurants = RestaurantRepo.loadRes(Category.chicken);
    List<Restaurant> nearbyRestaurant = restaurants
        .where((restaurants) => restaurants.location == "nearby")
        .toList();
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HalalHut',
                        style: header,
                      ),
                      Text(
                        'Find Halal options near you',
                        style: subline,
                      )
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/pfp.png',
                    height: 42,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    'Nearby',
                    style: subheader,
                  ),
                  SizedBox(height: 12),
                ],
              )
            ]),
          ),
          // SizedBox(
          //   width: 15,
          // ),
          Container(
            height: 310,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nearbyRestaurant.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RestaurantCard(restaurant: nearbyRestaurant[index]),
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: softgrey,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 16,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Browse by',
                    style: subheader,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 46,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ElevatedButton(
                          style: btnPill,
                          onPressed: () {
                            debugPrint('salads clicked');
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/burger.png', height: 22),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Burgers',
                                style: cate,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                          style: btnPill,
                          onPressed: () {
                            debugPrint('salads clicked');
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/burger.png', height: 22),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Chicken',
                                style: cate,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                          style: btnPill,
                          onPressed: () {
                            debugPrint('salads clicked');
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/burger.png', height: 22),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Chinese',
                                style: cate,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                          style: btnPill,
                          onPressed: () {
                            debugPrint('salads clicked');
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/burger.png', height: 22),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Pizzas',
                                style: cate,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: double.infinity, // Adjust the width as needed
                    ),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10, // vertical spacing
                            crossAxisSpacing: 10),
                        itemCount: (restaurants.length / 2).ceil(),
                        // size of each card
                        itemBuilder: (_, index) {
                          final bottom = index * 2;

                          return Row(children: [
                            Expanded(
                                child: RestaurantCard(
                              restaurant: restaurants[bottom],
                            )),
                            if (restaurants.length > bottom + 1)
                              SizedBox(
                                  width:
                                      4), // Adjust spacing between product cards
                            Expanded(
                              child: restaurants.length > bottom + 1
                                  ? RestaurantCard(
                                      restaurant: restaurants[bottom + 1])
                                  : SizedBox.shrink(),
                            ),
                          ]);
                        }))
              ],
            ),
          ),

          // Container(
          //   width: 210,
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //       left: 20,
          //       top: 16,
          //       bottom: 16,
          //     ),
          //     child: Column(children: [
          //       Container(
          //           clipBehavior: Clip.antiAlias,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(
          //                 50), // Adjust the radius as per your requirement
          //           ),
          //           child: Image.asset(
          //             width: 200,
          //             'assets/Boo-i.png',
          //             height: 250,
          //             fit: BoxFit.cover,
          //           )),
          //       // Image.asset(
          //       //   'assets/modern.png',
          //       //   height: 250,
          //       // ),
          //       const SizedBox(
          //         height: 8,
          //       ),
          //       Row(
          //         children: [
          //           Text(
          //             'Momos',
          //             style: product,
          //           ),
          //           const Spacer(),
          //           Row(
          //             children: [
          //               Image.asset(
          //                 'assets/star.png',
          //                 height: 20,
          //               ),
          //               SizedBox(
          //                 width: 4,
          //               ),
          //               Text(
          //                 '5.0',
          //                 style: produrct,
          //               )
          //             ],
          //           )
          //         ],
          //       )
          //     ]),
          //   ),
          // ),
        ]),
      ),
    ));
  }
}
