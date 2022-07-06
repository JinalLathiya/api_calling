class ImageModel {
  final int id;
  final String largeImageURL;

  ImageModel({
    required this.id,
    required this.largeImageURL,
  });

  factory ImageModel.fromJSON(Map json) {
    return ImageModel(
      id: json['id'],
      largeImageURL: json['largeImageURL'],
    );
  }
}


