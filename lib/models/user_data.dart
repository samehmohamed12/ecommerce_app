class UserDataModel {

  final String uid;
  final String email;

  UserDataModel({required this.email, required this.uid});

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('uid'): this.uid,
      keyMapper('email'): this.email,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map, String documentId) {


    return UserDataModel(
    uid: documentId,
    email: map[ ('email')]as String,
    );
  }
}