class Commits {
  final String name;
  final DateTime date;
  final String link;
  const Commits({
    required this.name,
    required this.date,
    required this.link,
  });
  Commits.fromJson(Map<String, dynamic> json)
      : name = json['commit']['message'],
        date = DateTime.parse(json['commit']['author']['date']),
        link = json['html_url'];
}
