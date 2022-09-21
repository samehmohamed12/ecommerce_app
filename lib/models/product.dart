class ProductModel {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int discountValue;
  final String? category;
  final int? rate;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      this.rate,
      required this.imgUrl,
      this.discountValue = 1,
      this.category = 'other'});

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('id'): id,
      keyMapper('title'): title,
      keyMapper('price'): price,
      keyMapper('imgUrl'): imgUrl,
      keyMapper('discountValue'): discountValue,
      keyMapper('category'): category,
      keyMapper('rate'): rate,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map, String documentId) {
    return ProductModel(
      id: documentId,
      title: map[('title')] as String,
      price: map[('price')] as int,
      imgUrl: map[('imgUrl')] as String,
      discountValue: map[('discountValue')] as int,
      category: map[('category')] as String,
      rate: map[('rate')] as int,
    );
  }
}

List<ProductModel> dummyProduct = [
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 150,
      imgUrl:
          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F49%2F56%2F49560dfa45732ed844e8e4742afdca248ee60f9f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 150,
      imgUrl:
          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F49%2F56%2F49560dfa45732ed844e8e4742afdca248ee60f9f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 150,
      imgUrl:
          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F49%2F56%2F49560dfa45732ed844e8e4742afdca248ee60f9f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 150,
      imgUrl:
          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F49%2F56%2F49560dfa45732ed844e8e4742afdca248ee60f9f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 150,
      imgUrl:
          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F49%2F56%2F49560dfa45732ed844e8e4742afdca248ee60f9f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 150,
      imgUrl:
          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F49%2F56%2F49560dfa45732ed844e8e4742afdca248ee60f9f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      category: 'Clothes',
      discountValue: 20),
];
