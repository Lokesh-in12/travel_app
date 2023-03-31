class BubbleRating {
  int? rating;
  String? numberReviews;

  BubbleRating({this.rating, this.numberReviews});

  factory BubbleRating.fromJson(Map<String, dynamic> json) => BubbleRating(
        rating: json['rating'] as int?,
        numberReviews: json['numberReviews'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'numberReviews': numberReviews,
      };
}
