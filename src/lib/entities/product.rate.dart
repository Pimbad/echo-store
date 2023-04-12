

class ProductRate{
  double rate;
  int count;

  ProductRate(this.rate, this.count);

  factory ProductRate.fromJson(dynamic json) =>
    ProductRate(
      json['rate'] as double,
      json['count'] as int);
}