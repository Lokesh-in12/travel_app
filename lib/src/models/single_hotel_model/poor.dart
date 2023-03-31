class Poor {
  int? percentage;
  String? count;

  Poor({this.percentage, this.count});

  factory Poor.fromJson(Map<String, dynamic> json) => Poor(
        percentage: json['percentage'] as int?,
        count: json['count'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'count': count,
      };
}
