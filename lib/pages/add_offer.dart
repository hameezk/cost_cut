import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cost_cut/models/offer_model.dart';
import 'package:cost_cut/pages/local_stores.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../widgets/background_image.dart';
import '../../widgets/top_widget.dart';
import '../config/colors.dart';
import '../widgets/snackbar.dart';

class AddOffer extends StatefulWidget {
  const AddOffer({Key? key}) : super(key: key);

  @override
  State<AddOffer> createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  Uuid uuid = const Uuid();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                const TopWidget(
                  title: 'Add Offer',
                  whiteTitle: false,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Store Name',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          TextField(
                            controller: nameController,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kLightBlack),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kBlueColor),
                              ),
                              hintText: 'Enter store name',
                              hintStyle: TextStyle(color: kLightBlack),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'category',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          TextField(
                            controller: categoryController,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kLightBlack),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kBlueColor),
                              ),
                              hintText: 'Enter category',
                              hintStyle: TextStyle(color: kLightBlack),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'description',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          TextField(
                            controller: descriptionController,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kLightBlack),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kBlueColor),
                              ),
                              hintText: 'Enter description',
                              hintStyle: TextStyle(color: kLightBlack),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'image',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          TextField(
                            controller: imageController,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kLightBlack),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kBlueColor),
                              ),
                              hintText: 'Enter image',
                              hintStyle: TextStyle(color: kLightBlack),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'latitude',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          TextField(
                            controller: latitudeController,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kLightBlack),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kBlueColor),
                              ),
                              hintText: 'Enter latitude',
                              hintStyle: TextStyle(color: kLightBlack),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'longitude',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          TextField(
                            controller: longitudeController,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kLightBlack),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kBlueColor),
                              ),
                              hintText: 'Enter longitude',
                              hintStyle: TextStyle(color: kLightBlack),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'url',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          TextField(
                            controller: urlController,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kLightBlack),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kBlueColor),
                              ),
                              hintText: 'Enter url',
                              hintStyle: TextStyle(color: kLightBlack),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'title',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          TextField(
                            controller: titleController,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kLightBlack),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kBlueColor),
                              ),
                              hintText: 'Enter title',
                              hintStyle: TextStyle(color: kLightBlack),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kBlueColor)),
                        child: const Text('Add Offer'),
                        onPressed: () {
                          addOffer();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addOffer() async {
    OfferModel newOffer = OfferModel(
      id: uuid.v1(),
      category: categoryController.text.trim(),
      name: nameController.text.trim(),
      image: imageController.text.trim(),
      description: descriptionController.text.trim(),
      url: urlController.text.trim(),
      title: titleController.text.trim(),
      longitude: longitudeController.text.trim(),
      latitude: latitudeController.text.trim(),
    );

    await FirebaseFirestore.instance
        .collection("offers")
        .doc(newOffer.id)
        .set(newOffer.toMap())
        .then(
      (value) {
        showCustomSnackbar(context: context, content: 'New offer created!');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LocalStores();
            },
          ),
        );
      },
    );
  }
}
