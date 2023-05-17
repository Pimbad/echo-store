

class ProductRate{
  num rate;
  int count;

  ProductRate(this.rate, this.count);

  factory ProductRate.fromJson(dynamic json) =>
    ProductRate(
      json['rate'] as num,
      json['count'] as int);

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}