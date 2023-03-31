class Excellent {
  int? percentage;
  String? count;

  Excellent({this.percentage, this.count});

  factory Excellent.fromJson(Map<String, dynamic> json) => Excellent(
        percentage: json['percentage'] as int?,
        count: json['count'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'count': count,
      };
}
