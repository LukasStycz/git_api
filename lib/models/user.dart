class User {
  final String name;
  final int publicRepositories;
  final String url;
  final String link;
  const User({
    required this.name,
    required this.publicRepositories,
    required this.url,
    required this.link,
  });
  User.fromJson(Map<String, dynamic> json)
      : name = json['login'],
        publicRepositories = json['public_repos'],
        url =
            'https://api.github.com/users/${json['login']}/repos?per_page=100',
        link = json['html_url'];
}
