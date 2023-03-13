import 'dart:ui';

import 'package:cost_cut/pages/maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/offer_model.dart';
import '../../widgets/background_image.dart';
import '../../widgets/offer_card.dart';
import '../../widgets/snackbar.dart';
import '../config/colors.dart';
import '../widgets/bottom_bar.dart';

class SearchPage extends StatefulWidget {
  final String searchKeyword;
  const SearchPage({Key? key, required this.searchKeyword}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool dataloaded = false;
  late PageController controller;
  TextEditingController searchCOntroller = TextEditingController();
  List<OfferModel> searchedOffers = [];
  List<OfferModel>? offers;
  String? searchKey;
  late int pageIndex = 0;
  int currentIndex = 1;
  List<String> allCategories = [];
  String? filter;
  int filterValue = 0;
  String ins = 'Local stores';
  late Future<void> allOffers;
  List<String> recentSearches = [];
  bool showRecent = false;

  @override
  void initState() {
    getRecentSearches();
    searchCOntroller.text = widget.searchKeyword;
    searchKey = searchCOntroller.text;
    allOffers = searchOffers();
    controller = PageController();

    super.initState();
  }

  @override
  void dispose() {
    searchCOntroller.text = '';
    searchKey = '';
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          )),
      backgroundColor: kBlueColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: [
              const BackgroundImage(),
              // const TopWidget(title: 'Search', whiteTitle: true),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: SizedBox(
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Card(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: TextField(
                                    controller: searchCOntroller,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search for My local stores',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: kMediumBlack),
                                    ),
                                    onTap: () {},
                                    onChanged: (value) {
                                      searchKey = value.trim();
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: InkWell(
                                  onTap: () {
                                    // FocusScope.of(context)
                                    //     .requestFocus(FocusNode());
                                    _handleSearch();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      color: kOrangeColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.search,
                                      color: kOffWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // TopSpace(
                  //   space: size.height * 0.35,
                  // ),
                  (searchKey == '' || searchKey == null)
                      ? Expanded(
                          child: RecentSearches(
                            recentSearches: recentSearches,
                            showRecent: showRecent,
                          ),
                        )
                      : FutureBuilder(
                          future: allOffers,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return
                                  // Expanded(
                                  //   child: PageView(
                                  //     clipBehavior: Clip.antiAlias,
                                  //     physics: const BouncingScrollPhysics(),
                                  //     controller: controller,
                                  //     onPageChanged: (value) => setState(() {
                                  //       pageIndex = value;
                                  //     }),
                                  //     children: [
                                  //       Column(
                                  //         children: [
                                  //           Expanded(
                                  //             child: OfferCard(
                                  //               offers: searchedOffers,
                                  //               categories: allCategories,
                                  //               ins: ins,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  (pageIndex == 0)
                                      ? Expanded(
                                          child: OfferCard(
                                            offers: searchedOffers,
                                            isFavourite: false,
                                          ),
                                        )
                                      : Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ShowMap(
                                                offerModels: searchedOffers),
                                          ),
                                        );
                              //     ],
                              //   ),
                              // );
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              );
                            }
                          }),

                  //yahan tk
                  //aska
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.transparent,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    pageIndex = 0;
                    setState(() {});
                    // controller.animateToPage(
                    //   0,
                    //   duration: const Duration(milliseconds: 400),
                    //   curve: Curves.easeInOut,
                    // );
                  },
                  child: Text(
                    'Offers',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: (pageIndex == 0) ? kGreenColor : kMediumBlack,
                        ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: const WormEffect(
                    activeDotColor: kGreenColor,
                    dotColor: kMediumBlack,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pageIndex = 1;
                    setState(() {});
                    // controller.animateToPage(
                    //   1,
                    //   duration: const Duration(milliseconds: 400),
                    //   curve: Curves.easeInOut,
                    // );
                  },
                  child: Text(
                    'Map',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: (pageIndex == 1) ? kGreenColor : kMediumBlack,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const BottomBar(currentIndex: 1),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          // style: Theme.of(context).textTheme.bodyText1,
        ),
      );

  searchOffers() async {
    for (var element in OfferModel.offers) {
      if (element.name!.contains(searchCOntroller.text.trim())) {
        searchedOffers.add(element);
      }
    }
  }

  void _handleSearch() async {
    await searchOffers();
  }

  Future offerCheck() async {
    if (dataloaded) {
    } else {
      dataloaded = true;
      await searchOffers();
    }
  }

  void getRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showRecent = prefs.getBool('recent') ?? false;
    recentSearches = prefs.getStringList('recentSearches') ?? [];
    setState(() {});
  }
}

class RecentSearches extends StatefulWidget {
  const RecentSearches({
    Key? key,
    required this.recentSearches,
    required this.showRecent,
  }) : super(key: key);

  final List<String> recentSearches;
  final bool showRecent;

  @override
  State<RecentSearches> createState() => _RecentSearchesState();
}

class _RecentSearchesState extends State<RecentSearches> {
  @override
  Widget build(BuildContext context) {
    print(OfferModel.offers.length);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Searches:',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              IconButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setStringList('recentSearches', []);
                  prefs.setBool('recent', false);
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return SearchPage(searchKeyword: '');
                    },
                  ));
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          (widget.showRecent)
              ? Expanded(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: widget.recentSearches.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return SearchPage(
                                    searchKeyword:
                                        widget.recentSearches[index]);
                              },
                            ));
                          },
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  CupertinoIcons.clock,
                                  color: kWhite,
                                ),
                              ),
                              Text(
                                widget.recentSearches[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const Text('No recent searches found'),
        ],
      ),
    );
  }
}
