class weather {
  final int id;
  final double temp;
  final int clouds;
  final String country;
  final String name;

  weather({
    required this.id,
    required this.temp,
    required this.clouds,
    required this.country,
    required this.name,
  });

  factory weather.FromJSON(Map<String, dynamic> json) {
    return weather(
        id: json['weather'][0]['id'],
        temp: json['main']['temp'],
        clouds: json['clouds']['all'],
        country: json['sys']['country'],
        name: json['name']);
  }
}
