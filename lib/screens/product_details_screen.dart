import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  int? id;
  String? description;
  double? price;
  int? count;
  double? rate;
  String? image;

  ProductDetailsScreen(
      {super.key,
      required this.id,
      required this.description,
      required this.price,
      required this.count,
      required this.image,
      required this.rate});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double contHeight = 35.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration:  BoxDecoration(
            image: DecorationImage(
                // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: NetworkImage(widget.image.toString()),
                fit: BoxFit.contain),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0.02,
                                blurRadius: 0.1,
                                // offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.02,
                              blurRadius: 0.1,
                              // offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10.0),
                child: Text(
                  "Details",
                  style: TextStyle(
                      shadows: [
                        BoxShadow(
                          blurStyle: BlurStyle.normal,
                          color: Colors.grey,
                          spreadRadius: 1.0,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: contHeight,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                '${widget.price.toString()} AED',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: contHeight == 34.h ? 30.h : 45.h,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  width: 100.w,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              contHeight = (contHeight == 35.h ? 50.h : 35.h);
                            });
                          },
                          icon: Icon(
                            contHeight == 35.h
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            size: 30,
                            color: Colors.blue,
                          )),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.02,
                                    blurRadius: 0.1,
                                    // offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  IconlyLight.upload,
                                  color: Colors.blue,
                                ),
                              )),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue),
                              child: const Center(
                                child: Text(
                                  "Order Now",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text("Description"),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.description.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      //  SizedBox(height: 3.h,),
                      Container(
                        height: 15.h,
                        width: 100.w,
                        padding: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Review (${widget.count.toString()})"),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 3.w,),
                                  Text(widget.rate.toString() , style: const TextStyle(fontSize: 22 , color: Colors.black),),
                                  // const Spacer(),
                                  SizedBox(width: 3.w,),
                                  RatingBar.builder(
                                    initialRating: widget.rate!.toDouble(),
                                    minRating: 1,
                                    //   itemSize: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,

                                    //   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, index) {
                                      return Transform.scale(
                                        scale: 1.0,
                                        child: const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                      );
                                    },
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(width: 5.w,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(height: 10.h,),
                    ],
                  ),
                ),
              ),
            ),
            // ElevatedButton(
            //   child: const Text('Close BottomSheet'),
            //   onPressed: () => Navigator.pop(context),
            // ),
          ],
        ),
      ),
    );
  }
// showBottomSheet(BuildContext context) async {
//
//   double contHeight = 20.h;
//
//   return WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//
//     showModalBottomSheet(
//       isScrollControlled: true,
//       isDismissible: false,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return SizedBox(
//               height: contHeight,
//               width: 100.w,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   const Text('AED039003' , style: TextStyle(color: Colors.white),),
//                   Expanded(
//                     child: Container(
//                       width: 100.w,
//                       decoration: const BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
//                       ),
//                       child: Column(
//                         children: [
//
//                           IconButton(onPressed: (){
//                             setState(() {
//
//                               contHeight = (contHeight == 20.h ? 40.h : 20.h);
//
//                             });
//                           }, icon: Icon( contHeight==20.h ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 40,)),
//
//                           Row(children: [
//                             Container(
//                                 padding: const EdgeInsets.all(2),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                     color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                      // spreadRadius: 5,
//                                      // blurRadius: 10,
//                                      // offset: Offset(0, 3), // changes position of shadow
//                                     ),
//                                   ],
//                                 ),
//                                 child: IconButton(onPressed: () {}, icon: const Icon(Icons.upload,),)),
//                           ],)
//                         ],
//                       ),
//                     ),
//                   ),
//                   // ElevatedButton(
//                   //   child: const Text('Close BottomSheet'),
//                   //   onPressed: () => Navigator.pop(context),
//                   // ),
//                 ],
//               ),
//             );
//           }
//         );
//       },
//     );
//
//   });
// }
}
