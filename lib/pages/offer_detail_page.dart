import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cost_cut/pages/maps.dart';
import 'package:cost_cut/widgets/snackbar.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/background_image.dart';
import '../../widgets/top_space.dart';
import '../config/colors.dart';
import '../models/offer_model.dart';

class OfferDetails extends StatefulWidget {
  final OfferModel offerModel;
  final bool fromfav;
  const OfferDetails(
      {Key? key, required this.offerModel, required this.fromfav})
      : super(key: key);

  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  List<String> favoutires = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            size: 28,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopSpace(space: size.height * 0.25),
                  SizedBox(
                    width: size.width * 0.55,
                    child: Text(
                      'Offer Details',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 20),
                        child: Column(
                          children: [
                            Text(
                              widget.offerModel.category ?? '',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Image.network(
                                    widget.offerModel.image ?? '',
                                    height: 100,
                                    width: size.width * 0.65,
                                  ),
                                ),

                                // IconButton(
                                //   onPressed: () {},
                                //   icon: const Icon(
                                //     Icons.web_asset,
                                //     color: Colors.grey,
                                //     size: 36,
                                //   ),
                                //   // label: const Text('Visit'),
                                // ),
                              ],
                            ),
                            Text(
                              widget.offerModel.name ?? '',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8),
                              child: Text(
                                widget.offerModel.description ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kBlueColor)),
                              onPressed: () async {
                                var url =
                                    Uri.parse(widget.offerModel.url ?? '');
                                if (!await launchUrl(url)) {
                                  showCustomSnackbar(
                                      context: context,
                                      content:
                                          'Clould not launch URL. Please check your connection.');
                                }
                              },
                              child: const Text('Visit Store'),
                            ),
                            (widget.fromfav)
                                ? Container(
                                    height: 0,
                                  )
                                : ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                kBlueColor)),
                                    onPressed: () async {
                                      addFavourite();
                                    },
                                    child: const Text('Add Favourite'),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Instructions',
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  ExpandableText(
                    widget.offerModel.description ?? '',
                    animation: true,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                    expandText: 'show more',
                    collapseText: 'show less',
                    maxLines: 2,
                    linkColor: Colors.blue,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.width * 0.85,
                        width: size.width * 0.85,
                        child: showMap(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const BackgroundImage(),
        ],
      ),
    );
  }

  showMap() {
    return ShowMap(offerModels: [widget.offerModel]);
  }

  Future<void> addFavourite() async {
    // if (favoutires.contains(widget.offerModel.id)) {
    // } else {
    favoutires.add(widget.offerModel.id!);
    await FirebaseFirestore.instance
        .collection("favourites")
        .doc(widget.offerModel.id!)
        .set(widget.offerModel.toMap())
        .then(
      (value) {
        showCustomSnackbar(context: context, content: 'Favorites added!');
      },
    );
    // }
  }
}
