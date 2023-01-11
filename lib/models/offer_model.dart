class OfferModel {
  String id;
  String name;
  String image;
  String description;
  String category;
  String title;
  String url;
  List<Map<String, String>> locations;
  OfferModel({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.description,
    required this.url,
    required this.title,
    required this.locations,
  });

  static List<OfferModel> demoOffers = [
    OfferModel(
      id: '0',
      category: 'Fashion/Footwear',
      name: 'Ndure',
      image:
          'https://cdn.shopify.com/s/files/1/0371/5416/0772/files/Ndure_130x30_ec41a742-1e80-42c6-a33a-d6cb11d17137.png?v=1636539714',
      description:
          'We believe in being ahead of our time, Immutable and diverse; embodied by our range of shoes that fit the multifaceted, multitasking youth of today. For each side of you, be it corporately cultured or funky fashioned, there is a shoe waiting in our stores. With us, you can change the world at your own pace.',
      url: 'https://www.ndure.com/',
      title: 'Flat 20% off on entire stock',
      locations: [
        {
          'longitude': '',
          'latitude': '',
        },
      ],
    ),
    OfferModel(
      id: '1',
      category: 'Fashion/Clothing/Footwear',
      name: 'Outfitters',
      image:
          'https://cdn.shopify.com/s/files/1/2290/7887/files/1200X628_aa0ccfa6-5e3d-4788-ae21-c97f6d74ba2e.jpg?v=1597126538',
      description:
          'Outfitters has separate product lines in order to cater to all segments and their demands - men, women and juniors. Within each line we offer a wide array of products which caters to a variety of different styles and preferences, from highly fashionable, on trend pieces to athleisure garments to more casual, every day attire and basic apparel.',
      url: 'https://outfitters.com.pk/',
      title: 'Flat 50% off on entire stock',
      locations: [
        {
          'longitude': '',
          'latitude': '',
        },
      ],
    ),
    OfferModel(
      id: '2',
      category: 'Clothing/Fashion/Fragrance',
      name: 'Bonanza Satrangi',
      image:
          'https://cdn.shopify.com/s/files/1/0464/1731/3955/files/Bonanza_Logo.png?v=1627287611',
      description:
          'The umbrella brand is now clearly divided into two: Bonanza Men\'s Formal Clothing, Knits, and Ethnic Wear; and Satrangi Women\'s Prêt, Unstitched, and Accessories.',
      url: 'https://bonanzasatrangi.com/',
      title: 'Upto 70% off on new stock',
      locations: [
        {
          'longitude': '',
          'latitude': '',
        },
      ],
    ),
    OfferModel(
      id: '3',
      category: 'Shoes/Clothing/Fashion',
      name: 'Metro Shoes',
      image:
          'https://cdn.shopify.com/s/files/1/0316/8249/4604/files/logon_210x@2x.png?v=1655198815',
      description:
          'Metro Shoes pampers your feet with the cushioned, contoured foot bed and experience all-day comfort! The best service, the best price, and the best design, all over the world.',
      url: 'https://www.metroshoes.com.pk/',
      title: 'Upto 40% off on entire stock',
      locations: [
        {
          'longitude': '',
          'latitude': '',
        },
      ],
    ),
  ];
}
