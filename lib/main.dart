import 'package:flutter/material.dart';
import 'package:fluttergithubclient/api_client.dart';
import 'package:fluttergithubclient/github_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Github Client',
      home:  Column(
        children: const [
          BuildInput()
        ],
      ),
    );
  }
}

class BuildInput extends StatefulWidget {
  const BuildInput({Key? key}) : super(key: key);

  @override
  _BuildInputState createState() => _BuildInputState();
}

class _BuildInputState extends State<BuildInput> {
  List<GithubRepository> _repositories = [];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Please enter a search repository name.',
              labelText: "search"
          ),
          onChanged: (inputString) {
            if (inputString.length >= 5) {
              ApiClient.instance.searchRepositories(inputString).then((repositories) {
                setState(() {
                  _repositories = repositories;
                });
              });
            }
          },
        )
    );
  }
}

class RepositoryList extends StatefulWidget {
  const RepositoryList({Key? key}) : super(key: key);

  @override
  _RepositoryListState createState() => _RepositoryListState();
}

class _RepositoryListState extends State<RepositoryList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


