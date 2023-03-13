// ignore_for_file: use_build_context_synchronously

import 'package:cost_cut/pages/local_stores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../config/colors.dart';
import '../models/faourite_model.dart';
import '../models/offer_model.dart';
import '../models/user_model.dart';
import '../pages/offer_detail_page.dart';

class OfferCard extends StatefulWidget {
  const OfferCard({
    Key? key,
    required this.offers,
    this.favourites,
    required this.isFavourite,
  }) : super(key: key);

  final List<OfferModel> offers;
  final List<FavouriteModel>? favourites;
  final bool isFavourite;

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  late bool isFavourite;
  @override
  void initState() {
    isFavourite = widget.isFavourite;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          mainAxisExtent: 250,
        ),
        itemCount: widget.offers.length,
        itemBuilder: (BuildContext ctx, index) {
          OfferModel offerModel = widget.offers[index];
          {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    alignment: Alignment.bottomCenter,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 600),
                    reverseDuration: const Duration(milliseconds: 600),
                    type: PageTransitionType.rightToLeft,
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
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              offerModel.category??'',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Image.network(offerModel.image??'',
                                    errorBuilder: (context, error, stackTrace) {
                                  return const Placeholder();
                                }),
                              ),
                            ),
                          ),
                          Text(
                            offerModel.name??'',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: SizedBox(
                              height: 80,
                              child: Text(
                                offerModel.description??'',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kWhite,
                      ),
                      child: IconButton(
                        onPressed: () async {
                          if (isFavourite) {
                            bool response = await removeFavourite(
                                widget.favourites![index].id);
                            if (response) {
                              setState(() {
                                isFavourite = false;
                              });
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const LocalStores();
                                },
                              ));
                            }
                          } else {
                            bool response = await addFavourite(
                              uid: UserModel.loggedinUser!.id.toString(),
                              offerId: offerModel.id,
                            );
                            if (response) {
                              setState(() {
                                isFavourite = true;
                              });
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const LocalStores();
                                },
                              ));
                            }
                          }
                        },
                        icon: isFavourite
                            ? const Icon(
                                CupertinoIcons.heart_slash_fill,
                                color: Color.fromARGB(255, 249, 21, 4),
                              )
                            : const Icon(
                                CupertinoIcons.heart_fill,
                                color: Color.fromARGB(255, 249, 21, 4),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future removeFavourite(String id) async {}

  Future addFavourite({required String uid, required offerId}) async {}
}
