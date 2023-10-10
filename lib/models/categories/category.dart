class Category {
  int id;
  String name;
  String image;
  int quantity;
  String creationAt;
  String updatedAt;

  Category({
    this.id = 0,
    this.name = "",
    this.image = "",
    this.quantity=0,
    this.creationAt = "",
    this.updatedAt = "",
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
        creationAt:
            json['creationAt'] == null ? "" : json['creationAt'] as String,
        updatedAt: json['updatedAt'] == null ? "" : json['updatedAt'] as String,
      );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'image': image,
  //       'creationAt': creationAt?.toIso8601String(),
  //       'updatedAt': updatedAt?.toIso8601String(),
  //     };
}
