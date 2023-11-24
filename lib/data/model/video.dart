

class Video{
  String? thumbnail;
  int? id;
  String? title;
  DateTime? dataAndTime;
  String? slug;
  DateTime? createdAt;
  String? manifest;
  int? liveStatus;
  String? liveManifest;
  bool? isLive;
  String? channelName;
  String? channelUsername;
  String? channelImage;
  bool? isVerified;
  String? channelSlug;
  int? channelSubscriber;
  int? channelId;
  String? type;
  int? viewers;
  String? duration;

  Video({this.title,this.duration,this.type,this.channelId,this.channelImage,this.channelName,
  this.channelSlug,this.channelSubscriber,this.channelUsername,this.createdAt,this.dataAndTime,
  this.id,this.isLive,this.isVerified,this.liveManifest,this.liveStatus,this.manifest,this.slug,
  this.thumbnail,this.viewers});

  factory Video.fromJson(Map<String, dynamic> json) {

    final createdAt = DateTime.parse(json['created_at']);
    final dateAndTime = DateTime.parse(json['date_and_time']);

    return Video(
      thumbnail: json['thumbnail'],
      id: json['id']??0,
      title: json['title'],
      dataAndTime: dateAndTime,
      slug: json['slug'],
      createdAt: createdAt,
      manifest: json['manifest'],
      liveStatus: json['live_status'],
      liveManifest: json['live_manifest'],
      isLive: json['is_live'],
      channelName: json['channel_name'],
      channelUsername: json['channel_username'],
      channelImage: json['channel_image'],
      isVerified: json['is_verified'],
      channelSlug: json['channel_slug'],
      channelSubscriber: int.parse(json['channel_subscriber']??'0'),
      channelId: json['channel_id'],
      type: json['type'],
      viewers: int.parse(json['viewers']??'0'),
      duration: json['duration']
    );
  }
}