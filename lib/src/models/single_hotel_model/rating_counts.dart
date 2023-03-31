import 'average.dart';
import 'excellent.dart';
import 'poor.dart';
import 'terrible.dart';
import 'very_good.dart';

class RatingCounts {
  Average? average;
  Excellent? excellent;
  Poor? poor;
  Terrible? terrible;
  VeryGood? veryGood;

  RatingCounts({
    this.average,
    this.excellent,
    this.poor,
    this.terrible,
    this.veryGood,
  });

  factory RatingCounts.fromJson(Map<String, dynamic> json) => RatingCounts(
        average: json['average'] == null
            ? null
            : Average.fromJson(json['average'] as Map<String, dynamic>),
        excellent: json['excellent'] == null
            ? null
            : Excellent.fromJson(json['excellent'] as Map<String, dynamic>),
        poor: json['poor'] == null
            ? null
            : Poor.fromJson(json['poor'] as Map<String, dynamic>),
        terrible: json['terrible'] == null
            ? null
            : Terrible.fromJson(json['terrible'] as Map<String, dynamic>),
        veryGood: json['veryGood'] == null
            ? null
            : VeryGood.fromJson(json['veryGood'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'average': average?.toJson(),
        'excellent': excellent?.toJson(),
        'poor': poor?.toJson(),
        'terrible': terrible?.toJson(),
        'veryGood': veryGood?.toJson(),
      };
}
