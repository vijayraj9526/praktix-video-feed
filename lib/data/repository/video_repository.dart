import '../models/video_model.dart';

class VideoRepository {
  List<VideoModel> fetchVideos() {
    return [
      VideoModel(
        id: 1,
        title: "Startup Growth Strategy",
        //corner case example
        videoUrl: "https://samplelib.commm/lib/preview/mp4/sample-5s.mp4",
        backupVideoAsset: "assets/offline_videos/5.mp4",
        expertName: "John Doe",
        expertTitle: "Startup Mentor",
        isPremium: false,
      ),
      VideoModel(
        id: 2,
        title: "AI in Business",
        videoUrl: "https://samplelib.com/lib/preview/mp4/sample-10s.mp4",
        backupVideoAsset: "assets/offline_videos/1.mp4",
        expertName: "Sarah Smith",
        expertTitle: "AI Consultant",
        isPremium: true,
        price: 5.0,
      ),
      VideoModel(
        id: 3,
        title: "Brand Storytelling Basics",
        videoUrl: "https://samplelib.com/lib/preview/mp4/sample-15s.mp4",
        backupVideoAsset: "assets/offline_videos/5.mp4",
        expertName: "Maya Lee",
        expertTitle: "Brand Strategist",
        isPremium: false,
      ),
      VideoModel(
        id: 4,
        title: "Personal Finance for Founders",
        videoUrl: "https://samplelib.com/lib/preview/mp4/sample-20s.mp4",
        backupVideoAsset: "assets/offline_videos/4.mp4",
        expertName: "David Kim",
        expertTitle: "Finance Coach",
        isPremium: true,
        price: 3.5,
      ),
      VideoModel(
        id: 5,
        title: "Design Thinking Sprint",
        videoUrl: "https://samplelib.com/lib/preview/mp4/sample-30s.mp4",
        backupVideoAsset: "assets/offline_videos/5.mp4",
        expertName: "Elena Cruz",
        expertTitle: "Product Designer",
        isPremium: false,
      ),
      VideoModel(
        id: 6,
        title: "Lead Generation in 2026",
        videoUrl: "https://samplelib.com/lib/preview/mp4/sample-5mb.mp4",
        backupVideoAsset: "assets/offline_videos/0.mp4",
        expertName: "Noah Parker",
        expertTitle: "Growth Marketer",
        isPremium: true,
        price: 4.0,
      ),
      VideoModel(
        id: 7,
        title: "Public Speaking Confidence",
        videoUrl: "https://samplelib.com/lib/preview/mp4/sample-10mb.mp4",
        backupVideoAsset: "assets/offline_videos/1.mp4",
        expertName: "Ava Thompson",
        expertTitle: "Communication Coach",
        isPremium: false,
      ),
      VideoModel(
        id: 8,
        title: "Team Leadership Essentials",
        videoUrl: "https://samplelib.com/lib/preview/mp4/sample-15mb.mp4",
        backupVideoAsset: "assets/offline_videos/3.mp4",
        expertName: "Liam Walker",
        expertTitle: "Leadership Mentor",
        isPremium: true,
        price: 6.0,
      ),
    ];
  }
}
