import 'avatar.dart';

class UserProfile {
  String? deprecatedContributionCount;
  Avatar? avatar;

  UserProfile({this.deprecatedContributionCount, this.avatar});

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        deprecatedContributionCount:
            json['deprecatedContributionCount'] as String?,
        avatar: json['avatar'] == null
            ? null
            : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'deprecatedContributionCount': deprecatedContributionCount,
        'avatar': avatar?.toJson(),
      };
}
