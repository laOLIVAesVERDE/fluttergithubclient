import 'package:flutter/material.dart';
import 'package:fluttergithubclient/api_client.dart';

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

  Widget _buildInput() {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Please enter a search repository name.",
          labelText: "search"
        ),
        onChanged: (inputString) {
          if (inputString.length >= 5) {
            ApiClient.instance.searchRepositories(inputString).then((repositories) {
              
            }
          }
        },
      ),
    )
  }
}
