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
    return MaterialApp(
      title: 'Github Client',
      home:  ,
    );
  }
}

class _buildInput extends StatefulWidget {
  const _buildInput({Key? key}) : super(key: key);

  @override
  _buildInputState createState() => _buildInputState();
}

class _buildInputState extends State<_buildInput> {
  List<GithubRepository> _repositories = [];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16.0),
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

