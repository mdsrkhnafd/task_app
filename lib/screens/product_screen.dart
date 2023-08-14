import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_app/screens/product_details_screen.dart';
import 'package:task_app/view_model/product_view_model.dart';

import '../data/response/status.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            width: 100.w,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0.02,
                  blurRadius: 0.5,
                  // offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: const Center(
                child: Text(
              "All Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: Consumer<ProductViewViewModel>(
              builder: (context, provider, child) {
                switch (provider.response.status) {
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator());
                  case Status.ERROR:
                    return Text(provider.response.message.toString());
                  case Status.COMPLETED:
                    if (provider.response.data == null ||
                        provider.response.data.isEmpty) {
                      // Handle the scenario when there's no data available
                      return const Center(
                          child: Text(
                        'No data available',
                        style: TextStyle(fontSize: 30),
                      ));
                    }
                    return ListView.builder(
                      itemCount: provider.productList!.length,
                      itemBuilder: (context, index) {
                        final data = provider.productList![index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    id: int.parse(
                                      data.id.toString(),
                                    ),
                                    description: data.description.toString(),
                                    image: data.image.toString(),
                                    price:
                                        double.tryParse(data.price.toString()),
                                    count: int.parse(
                                        data.rating!.count.toString()),
                                    rate: double.tryParse(
                                        data.rating!.rate.toString()),
                                  ),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.02,
                                    blurRadius: 0.5,
                                    // offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: 30.h,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: data.image != null
                                            ? DecorationImage(
                                                image:
                                                    NetworkImage(data.image!),
                                                fit: BoxFit.fill,
                                              )
                                            : null, // Set image to null if data.image is null
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${data.price.toString()} AED",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  shadows: [
                                                    BoxShadow(
                                                      blurStyle:
                                                          BlurStyle.normal,
                                                      color: Colors.grey,
                                                      spreadRadius: 1.0,
                                                      blurRadius: 5,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            RatingBar.builder(
                                              initialRating:
                                                  data.rating!.rate!.toDouble(),
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              // itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                              itemBuilder: (context, index) {
                                                return Transform.scale(
                                                  scale: 0.6,
                                                  child: const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                );
                                              },
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(data.title.toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      data.description.toString() * 50,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  default:
                    return Container();
                }
                return Container();
              },
            ),
          )
        ],
      ),
    ));
  }
}
