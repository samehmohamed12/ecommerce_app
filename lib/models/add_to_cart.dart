class AddToCartModel {
  final String id;
  final String productId;
  final String title;
  final int price;
  final String imgUrl;
  final int discountValue;
  final int quantity;

  AddToCartModel(
      {required this.id,
      required this.productId,
      required this.title,
      required this.price,
      required this.imgUrl,
      this.discountValue = 0,
      this.quantity = 1});

  Map<String, dynamic> toMap() {
    return {
      ('id'): this.id,
      ('productId'): this.productId,
      ('title'): this.title,
      ('price'): this.price,
      ('imgUrl'): this.imgUrl,
      ('discountValue'): this.discountValue,
      ('quantity'): this.quantity,
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map, String documentId) {
    return AddToCartModel(
      id: documentId,
      productId: map[('productId')] as String,
      title: map[('title')] as String,
      price: map[('price')]  ,
      imgUrl: map[('imgUrl')] as String,
      discountValue: map[('discountValue')] as int,
      quantity: map[('quantity')] as int,
    );
  }
}
