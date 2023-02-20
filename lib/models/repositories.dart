class Repositories {
  final String name;
  final DateTime date;
  final String link;
  const Repositories({
    required this.name,
    required this.date,
    required this.link,
  });
  Repositories.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        date = DateTime.parse(json['created_at']),
        link = json['svn_url'];
}
