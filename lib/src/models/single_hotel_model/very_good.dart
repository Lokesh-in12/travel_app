class VeryGood {
  int? percentage;
  String? count;

  VeryGood({this.percentage, this.count});

  factory VeryGood.fromJson(Map<String, dynamic> json) => VeryGood(
        percentage: json['percentage'] as int?,
        count: json['count'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'count': count,
      };
}
