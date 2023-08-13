

// To parse this JSON data, do
//
//     final gallaryImage = gallaryImageFromJson(jsonString);

import 'dart:convert';

GallaryImage gallaryImageFromJson(String str) => GallaryImage.fromJson(json.decode(str));

String gallaryImageToJson(GallaryImage data) => json.encode(data.toJson());

class GallaryImage {
    GallaryImage({
        this.albumId,
        this.id,
        this.title,
        this.url,
        this.thumbnailUrl,
    });

    final int? albumId;
    final int? id;
    final String? title;
    final String? url;
    final String? thumbnailUrl;

    factory GallaryImage.fromJson(Map<String, dynamic> json) => GallaryImage(
        albumId: json["albumId"] == null ? null : json["albumId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        thumbnailUrl: json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId == null ? null : albumId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
    };
}
