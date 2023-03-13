import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cost_cut/models/user_model.dart';
import 'package:cost_cut/pages/add_offer.dart';
import 'package:cost_cut/pages/offer_detail_page.dart';
import 'package:cost_cut/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../models/offer_model.dart';
import '../../widgets/background_image.dart';
import '../../widgets/top_space.dart';
import '../../widgets/top_widget.dart';
import '../config/colors.dart';
import '../models/faourite_model.dart';

class LocalStores extends StatefulWidget {
  const LocalStores({Key? key}) : super(key: key);

  @override
  State<LocalStores> createState() => _LocalStoresState();
}

class _LocalStoresState extends State<LocalStores> {
  List<OfferModel> offers = [];
  String ins = 'Local stores';
  List<FavouriteModel>? favourites;
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OfferModel.offers = [];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kGreenColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            const BackgroundImage(),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopSpace(space: size.height * 0.20),
                  SizedBox(
                    width: size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Offers',
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: kOffWhite,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        (UserModel.loggedinUser!.role == 'admin')
                            ? ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      alignment: Alignment.bottomCenter,
                                      curve: Curves.easeInOut,
                                      duration:
                                          const Duration(milliseconds: 600),
                                      reverseDuration:
                                          const Duration(milliseconds: 600),
                                      type: PageTransitionType.rightToLeft,
                                      child: const AddOffer(),
                                    ),
                                  );
                                },
                                child: const Text("Add Offer"),
                              )
                            : Container(
                                height: 0,
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                TopSpace(
                  space: size.height * 0.25,
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("offers")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          QuerySnapshot dataSnapshot =
                              snapshot.data as QuerySnapshot;
                          if (dataSnapshot.docs.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                shrinkWrap: true,
                                primary: false,
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  mainAxisExtent: 250,
                                ),
                                itemCount: dataSnapshot.docs.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  Map<String, dynamic> userMap =
                                      dataSnapshot.docs[index].data()
                                          as Map<String, dynamic>;
                                  OfferModel offerModel =
                                      OfferModel.fromMap(userMap);
                                  {
                                    OfferModel.offers.add(offerModel);
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            alignment: Alignment.bottomCenter,
                                            curve: Curves.easeInOut,
                                            duration: const Duration(
                                                milliseconds: 600),
                                            reverseDuration: const Duration(
                                                milliseconds: 600),
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: OfferDetails(
                                              offerModel: offerModel,
                                              fromfav: false,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  FittedBox(
                                                    child: Text(
                                                      offerModel.category ?? '',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16,
                                                          ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10.0),
                                                      child: SizedBox(
                                                        height: 50,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.45,
                                                        child: Image.network(
                                                            offerModel.image ??
                                                                '',
                                                            errorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                          return const Placeholder();
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    offerModel.name ?? '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 18,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10.0),
                                                    child: SizedBox(
                                                      height: 80,
                                                      child: Text(
                                                        offerModel
                                                                .description ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 4,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Positioned(
                                          //   right: 0,
                                          //   top: 0,
                                          //   child: Container(
                                          //     decoration: const BoxDecoration(
                                          //       shape: BoxShape.circle,
                                          //       color: kWhite,
                                          //     ),
                                          //     child: IconButton(
                                          //       onPressed: () async {
                                          //         if (isFavourite) {
                                          //           bool response =
                                          //               await removeFavourite(
                                          //                   favourites![index]
                                          //                       .id);
                                          //           if (response) {
                                          //             setState(() {
                                          //               isFavourite = false;
                                          //             });
                                          //             // ignore: use_build_context_synchronously
                                          //             Navigator.pushReplacement(
                                          //                 ctx, MaterialPageRoute(
                                          //               builder: (context) {
                                          //                 return const LocalStores();
                                          //               },
                                          //             ));
                                          //           }
                                          //         } else {
                                          //           bool response =
                                          //               await addFavourite(
                                          //             uid: UserModel
                                          //                 .loggedinUser!.id
                                          //                 .toString(),
                                          //             offerId: offerModel.id,
                                          //           );
                                          //           if (response) {
                                          //             setState(() {
                                          //               isFavourite = true;
                                          //             });
                                          //             // ignore: use_build_context_synchronously
                                          //             Navigator.pushReplacement(
                                          //                 context,
                                          //                 MaterialPageRoute(
                                          //               builder: (context) {
                                          //                 return const LocalStores();
                                          //               },
                                          //             ));
                                          //           }
                                          //         }
                                          //       },
                                          //       icon: isFavourite
                                          //           ? const Icon(
                                          //               CupertinoIcons
                                          //                   .heart_slash_fill,
                                          //               color: Color.fromARGB(
                                          //                   255, 249, 21, 4),
                                          //             )
                                          //           : const Icon(
                                          //               CupertinoIcons.heart_fill,
                                          //               color: Color.fromARGB(
                                          //                   255, 249, 21, 4),
                                          //             ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          } else {
                            return const Center(
                              child: Center(
                                child: Text(
                                  "No results found!",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            );
                          }
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Center(
                              child: Text(
                                "An error occoured!",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const Text(
                            "No results found!",
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          );
                        }
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  // child: FutureBuilder(
                  //   future: getLocalOffers(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.done) {
                  //       return Padding(
                  //         padding: const EdgeInsets.symmetric(vertical: 10.0),
                  //         child: Expanded(
                  //           child: OfferCard(
                  //             offers: offers,
                  //             isFavourite: false,
                  //           ),
                  //         ),
                  //       );
                  //     } else {
                  //       return const Center(
                  //         child: CircularProgressIndicator(
                  //           color: kBlueColor,
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: 0),
    );
  }

  getLocalOffers() async {
    // offers = OfferModel.demoOffers;
    var snapshots = FirebaseFirestore.instance.collection("offers").snapshots();
  }

  Future removeFavourite(String id) async {}

  Future addFavourite({required String uid, required offerId}) async {}
}
