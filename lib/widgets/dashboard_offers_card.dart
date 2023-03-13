
import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../models/offer_model.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key? key,
    required this.size,
    required this.title,
    required this.seeMore,
    required this.dataList,
  }) : super(key: key);

  final Size size;
  final String title;
  final Function() seeMore;
  final List<OfferModel> dataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.20,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: seeMore,
                child: const Text(
                  'See more',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kLightBlack),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: size.height * 0.16,
            width: size.width,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                OfferModel offerModel = dataList[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: 180,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      width: 55,
                      child: Image.network(
                        offerModel.image??'',
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10);
              },
            ),
          )
        ],
      ),
      
    );
  }
}
