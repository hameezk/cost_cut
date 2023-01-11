import 'package:cost_cut/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../models/offer_model.dart';
import '../../widgets/background_image.dart';
import '../../widgets/offer_card.dart';
import '../../widgets/snackbar.dart';
import '../../widgets/top_space.dart';
import '../../widgets/top_widget.dart';
import '../config/colors.dart';

class LocalStores extends StatefulWidget {
  const LocalStores({Key? key}) : super(key: key);

  @override
  State<LocalStores> createState() => _LocalStoresState();
}

class _LocalStoresState extends State<LocalStores> {
  List<OfferModel> offers = [];
  String ins = 'Local stores';
  @override
  Widget build(BuildContext context) {
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
            const TopWidget(title: 'Offers', whiteTitle: true),
            Column(
              children: [
                TopSpace(
                  space: size.height * 0.25,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: getLocalOffers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Expanded(
                            child: OfferCard(
                              offers: offers,
                              isFavourite: false,
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: kBlueColor,
                          ),
                        );
                      }
                    },
                  ),
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
    offers = OfferModel.demoOffers;
  }
}
