class SearchResult {
  final int id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;

  SearchResult({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      id: json['id'],
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );
  }
}
