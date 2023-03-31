class Terrible {
  int? percentage;
  String? count;

  Terrible({this.percentage, this.count});

  factory Terrible.fromJson(Map<String, dynamic> json) => Terrible(
        percentage: json['percentage'] as int?,
        count: json['count'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'count': count,
      };
}
