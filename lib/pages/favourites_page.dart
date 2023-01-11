import 'package:cost_cut/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../widgets/background_image.dart';
import '../../widgets/offer_card.dart';
import '../../widgets/top_space.dart';
import '../../widgets/top_widget.dart';
import '../models/faourite_model.dart';
import '../models/offer_model.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  int pageIndex = 2;
  List<FavouriteModel> favourites = [];
  List<OfferModel> favouriteOffers = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kOrangeColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            const BackgroundImage(),
            const TopWidget(
              title: 'Favourites',
              whiteTitle: true,
            ),
            Column(
              children: [
                TopSpace(
                  space: size.height * 0.35,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: getFavourites(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return OfferCard(
                          offers: favouriteOffers,
                          isFavourite: true,
                          favourites: favourites,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: kOrangeColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: 2),
    );
  }

  getFavourites() {}
}
