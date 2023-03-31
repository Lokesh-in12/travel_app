class Price {
  dynamic strikeThroughPrice;
  String? status;
  String? providerName;
  dynamic freeCancellation;
  dynamic pricingPeriod;

  Price({
    this.strikeThroughPrice,
    this.status,
    this.providerName,
    this.freeCancellation,
    this.pricingPeriod,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        strikeThroughPrice: json['strikeThroughPrice'] as dynamic,
        status: json['status'] as String?,
        providerName: json['providerName'] as String?,
        freeCancellation: json['freeCancellation'] as dynamic,
        pricingPeriod: json['pricingPeriod'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'strikeThroughPrice': strikeThroughPrice,
        'status': status,
        'providerName': providerName,
        'freeCancellation': freeCancellation,
        'pricingPeriod': pricingPeriod,
      };
}
