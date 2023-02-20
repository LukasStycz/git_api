import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_api/models/user.dart';
import 'package:git_api/pages/repos_and_commits_page.dart';
import 'package:http/http.dart' as http;

class FindPage extends StatefulWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  final TextEditingController userName = TextEditingController();
  bool userExist = false;
  User user = const User(login: '', publicRepositories: 500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Find Github User')),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 40, 8, 20),
            child: TextField(
                controller: userName,
                decoration: const InputDecoration(
                    hintText: 'Write User Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
            child: ElevatedButton(
              onPressed: findUser,
              child: const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 12),
                child: Text('Find User'),
              ),
            ),
          ),
          showUser()
        ],
      ),
    );
  }

  Widget showUser() {
    if (userExist == false) {
      return const SizedBox(height: 1);
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListTile(
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            title: Text(user.login),
            subtitle: Text('Public Repos: ${user.publicRepositories}'),
            trailing: PopupMenuButton(
              onSelected: (value) {
                if (value == 'Repositories') {
                  navigateToReposAndCommitsPage(userName.text);
                }
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(value: 'Repositories', child: Text('Repositories'))
                ];
              },
            )),
      );
    }
  }

  Future<void> findUser() async {
    final url = 'https://api.github.com/users/${userName.text}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final responseBody = response.body;
    if (response.statusCode == 200) {
      setState(() {
        user = User.fromJson(jsonDecode(responseBody));
        userExist = true;
      });
    } else {
      showErrorMessage();
    }
  }

  void showErrorMessage() {
    const snackBar = SnackBar(
      content: Text(style: TextStyle(color: Colors.white), 'User Not Found'),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void navigateToReposAndCommitsPage(String userName) {
    final route =
        MaterialPageRoute(builder: (context) =>  ReposAndCommitsPage(userName: userName));
    Navigator.push(context, route);
  }
}
