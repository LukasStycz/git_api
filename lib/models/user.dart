class User {
  final String login;
  final int publicRepositories;
  const User({required this.login, required this.publicRepositories});
  User.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        publicRepositories = json['public_repos'];
}