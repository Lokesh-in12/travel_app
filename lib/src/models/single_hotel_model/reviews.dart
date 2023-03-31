import 'content.dart';
import 'rating_counts.dart';

class Reviews {
  List<Content>? content;
  int? count;
  double? ratingValue;
  RatingCounts? ratingCounts;

  Reviews({this.content, this.count, this.ratingValue, this.ratingCounts});

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        content: (json['content'] as List<dynamic>?)
            ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
            .toList(),
        count: json['count'] as int?,
        ratingValue: (json['ratingValue'] as num?)?.toDouble(),
        ratingCounts: json['ratingCounts'] == null
            ? null
            : RatingCounts.fromJson(
                json['ratingCounts'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'content': content?.map((e) => e.toJson()).toList(),
        'count': count,
        'ratingValue': ratingValue,
        'ratingCounts': ratingCounts?.toJson(),
      };
}
