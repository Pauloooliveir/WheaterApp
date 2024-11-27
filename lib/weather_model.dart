class Weather {
  final String date;
  final double temperature;
  final String description;
  final String icon;

  Weather({
    required this.date,
    required this.temperature,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      date: json['date'],
      temperature: json['temperature'].toDouble(),
      description: json['description'],
      icon: json['icon'],
    );
  }
}
