class ModelUser {
  ModelUser(
      {this.id = 0,
      this.email: 'anonimo@anonimo.com.co',
      this.firstName: 'Anonimo',
      this.lastName: 'Doe',
      this.avatar: 'https://reqres.in/img/faces/1-image.jpg',
      this.sqlId});

  final int id;
  int? sqlId;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        id: json["id"] as int,
        sqlId: json["sqlId"] as int?,
        email: json["email"] as String,
        firstName: json["first_name"] as String,
        lastName: json["last_name"] as String,
        avatar: json["avatar"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sqlId": sqlId,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
