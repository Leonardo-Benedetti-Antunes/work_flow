class ImageModel {
  final int? id;
  final int serviceOrderId;
  final String? title;
  final String imageUrl;

  ImageModel({
    this.id,
    required this.serviceOrderId,
    this.title,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'service_order_id': serviceOrderId,
    'title': title,
    'image_url': imageUrl,
  };

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'],
      serviceOrderId: map['service_order_id'],
      title: map['title'],
      imageUrl: map['image_url'],
    );
  }
}
