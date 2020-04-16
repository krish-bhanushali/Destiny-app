import 'main.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'main.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name)
    {
      case '/':
        return MaterialPageRoute(builder: (_)=> DestiniHome());
      case '/main':
        return MaterialPageRoute(builder: (_)=> DestiniHome());
      case '/Story1':
        return MaterialPageRoute(builder: (_)=> StoryPage());
      default:
        return _errorRoute();

    }


  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('ERROR'),
        ),
        body: Center(
          child: Text('Error 404 , Sorry',style: TextStyle(color: Colors.white),),
        ),
      );
    });
  }


}