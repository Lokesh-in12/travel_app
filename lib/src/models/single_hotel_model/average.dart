class Average {
  int? percentage;
  String? count;

  Average({this.percentage, this.count});

  factory Average.fromJson(Map<String, dynamic> json) => Average(
        percentage: json['percentage'] as int?,
        count: json['count'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'count': count,
      };
}
