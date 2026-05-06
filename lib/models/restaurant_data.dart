class RestaurantData {
  final String id;
  final String name;
  final String location;
  final String price;
  final String? imageUrl;
  final String? hours;       // e.g. '8am–5pm'
  final String? description;
  final List<String>? tags;  // e.g. ['lunch', 'chicken', 'pork']

  const RestaurantData({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    this.imageUrl,
    this.hours,
    this.description,
    this.tags,
  });
}