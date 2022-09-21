class DeliveryMethodsModel {
  final String name;
  final String id;
  final String imgUrl;
  final String days;
  final int price;

  DeliveryMethodsModel(
      {required this.name,
      required this.id,
      required this.imgUrl,
      required this.days,
      required this.price});

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('name'): this.name,
      keyMapper('id'): this.id,
      keyMapper('imgUrl'): this.imgUrl,
      keyMapper('days'): this.days,
      keyMapper('price'): this.price,
    };
  }

  factory DeliveryMethodsModel.fromMap(
      Map<String, dynamic> map, String documentId) {
    return DeliveryMethodsModel(
      name: map[('name')] as String,
      id: documentId,
      imgUrl: map[('imgUrl')] as String,
      days: map[('days')] as String,
      price: map[('price')] as int,
    );
  }
}
