// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotiModel {
  int id;
  String title;
  String subTitle;
  String image;
  DateTime? createDate;
  int userId;

  NotiModel(
      {this.id = 0,
      this.title = "",
      this.subTitle = "",
      this.image = "",
      this.userId =0,
      this.createDate});

  factory NotiModel.fromMap(Map<String, dynamic> map) {
    return NotiModel(
      id: map['id'],
      title: map['title'],
      subTitle: map['subtitle'],
      image: map['image'],
      userId: map['userId'],
      createDate:
          map['createDate'] != null ? DateTime.parse(map['createDate']) : null,
    );
  }

  // Hàm chuyển đối tượng thành Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subTitle,
      'image': image,
      'userId': userId,
      'createDate':
          createDate?.toIso8601String(), // Chuyển ngày thành chuỗi ISO8601
    };
  }
}
