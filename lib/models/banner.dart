class BannerModel{
  String id;
  String imgUrl;
  String name;

  BannerModel({required this.id,required this.imgUrl,required this.name});
  factory BannerModel.fromMap(Map<String, dynamic> map, String documentId) {
    return BannerModel(
      id: documentId,
      imgUrl: map[('imgUrl')] as String,
      name: map[('name')] as String,
    );
  }
}