class Commits {
  final String name;
  final DateTime date;
  final String link;
  final String url;
  const Commits(
      {required this.name,
      required this.date,
      required this.link,
      required this.url});
  Commits.fromJson(Map<String, dynamic> json)
      : name = json['commit']['message'],
        date = DateTime.parse(json['commit']['author']['date']),
        link = json['html_url'],
        url =
            'https://api.github.com/users/${json['url'].toString().split('/')[4]}/repos?per_page=100';
}
