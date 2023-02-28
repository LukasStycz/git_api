class Repositories {
  final String name;
  final DateTime date;
  final String link;
  final String url;
  const Repositories({
    required this.name,
    required this.date,
    required this.link,
    required this.url,
  });
  Repositories.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        date = DateTime.parse(json['created_at']),
        link = json['svn_url'],
        url =
            'https://api.github.com/repos/${json['full_name']}/commits?per_page=100';
}
