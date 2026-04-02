class VideoModel {
  final int id;
  final String title;
  final String videoUrl;
  final String? backupVideoAsset;
  final String expertName;
  final String expertTitle;
  final bool isPremium;
  final double? price;
  final bool isUnlocked;
  final bool isLiked;
  final bool isSaved;

  VideoModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    this.backupVideoAsset,
    required this.expertName,
    required this.expertTitle,
    required this.isPremium,
    this.price,
    this.isUnlocked = false,
    this.isLiked = false,
    this.isSaved = false,
  });

  VideoModel copyWith({bool? isUnlocked, bool? isLiked, bool? isSaved}) {
    return VideoModel(
      id: id,
      title: title,
      videoUrl: videoUrl,
      backupVideoAsset: backupVideoAsset,
      expertName: expertName,
      expertTitle: expertTitle,
      isPremium: isPremium,
      price: price,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
