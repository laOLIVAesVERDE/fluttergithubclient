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
    return  const MaterialApp(
      title: 'Github Client',
      home:  SearchGithubRepository()
    );
  }
}

class SearchGithubRepository extends StatefulWidget {
  const SearchGithubRepository({Key? key}) : super(key: key);

  @override
  _SearchGithubRepositoryState createState() => _SearchGithubRepositoryState();
}

class _SearchGithubRepositoryState extends State<SearchGithubRepository> {
  List<GithubRepository> _repositories = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Client"),
      ),
      body: Column(
        children: [_searchTextField(), _buildRepositoryItemList()],
      ),
    );
  }

  Widget _searchTextField() {
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

  Widget _buildRepositoryItemList() {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final repository = _repositories[index];
          return _buildRepositoryItem(repository);
        },
      itemCount: _repositories.length,
    );
  }

  Widget _buildRepositoryItem(GithubRepository repository) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              repository.fullName,
              style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0
              ),
            ),
          ),
          repository.language != null ? Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
            child: Text(
              repository.language,
              style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12.0
              ),
            ),
          ) : Container(),
          repository.description != null ? Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
            child: Text(
              repository.description,
                style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.grey
                )
            ),
          ) : Container()
        ],
      ),
    );
  }
}


