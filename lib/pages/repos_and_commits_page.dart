
import 'dart:convert';
import 'package:git_api/models/commits.dart';
import 'package:git_api/models/repositories.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReposAndCommitsPage extends StatefulWidget {
  final String? userName;
  const ReposAndCommitsPage({this.userName, Key? key}) : super(key: key);
  @override
  State<ReposAndCommitsPage> createState() => _ReposAndCommitsPageState();
}

class _ReposAndCommitsPageState extends State<ReposAndCommitsPage> {
  List<Commits> commits = [];
  List<Repositories> repos = [];
  bool isLoading = true;
  bool isRepos = true;

  @override
  void initState() {
    super.initState();
    findRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child:
            isRepos ? const Text('Repositories') : const Text('Commits')),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
          itemCount: isRepos ? repos.length : commits.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, top: 20, right: 8),
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                title: isRepos
                    ? Text(repos[index].name)
                    : Text(commits[index].name),
                subtitle: isRepos
                    ? Text('Created at: ${repos[index].date}')
                    : Text('Commit date: ${commits[index].date}'),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 'Commits') {
                      findCommits(repos[index].name);
                    } else if (value == 'Repository WebSite') {
                      _launchUrl(repos[index].link);
                    } else if (value == 'Back to Repositories') {
                      findRepos();
                    } else if (value == 'Commit WebSite') {
                      _launchUrl(commits[index].link);
                    }
                  },
                  itemBuilder: (context) {
                    return isRepos
                        ? [
                      const PopupMenuItem(
                          value: 'Commits', child: Text('Commits')),
                      const PopupMenuItem(
                          value: 'Repository WebSite',
                          child: Text('Repository WebSite')),
                    ]
                        : [
                      const PopupMenuItem(
                          value: 'Back to Repositories', child: Text('Back to Repositories')),
                      const PopupMenuItem(
                          value: 'Commit WebSite',
                          child: Text('Commit WebSite')),
                    ];
                  },
                ),
              ),
            );
          }),
    );
  }

  Future<void> findCommits(String repoName) async {
    const String commitsErrorMessage = 'Commits';
    setState(() {
      isLoading = true;
      isRepos = false;
    });
    final url =
        'https://api.github.com/repos/${widget.userName}/$repoName/commits?per_page=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    Iterable l = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        commits = List<Commits>.from(l.map((model){
          return Commits.fromJson(model);
        }));
        String dupa =commits[0].date.toString().split('.')[0];
        isLoading = false;
        print(dupa);
      });
    } else {
      showErrorMessage(commitsErrorMessage);
    }
  }

  Future<void> findRepos() async {
    const String reposErrorMessage = 'Repositories';
    setState(() {
      isRepos = true;
    });
    final url =
        'https://api.github.com/users/${widget.userName}/repos?per_page=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    Iterable l = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        repos = List<Repositories>.from(l.map((model){
          return Repositories.fromJson(model);
        }));
        isLoading = false;
      });
    } else {
      showErrorMessage(reposErrorMessage);
    }
  }

  void showErrorMessage(String errorMessage) {
    final snackBar = SnackBar(
      content: Text(
          style: const TextStyle(color: Colors.white),
          '$errorMessage Not Found'),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
