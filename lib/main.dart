import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'route_generator.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: DestiniHome(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );

  }
}

class DestiniHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background3.jpg"),
              fit: BoxFit.cover,
            ),),
          child: ListView(
            children: <Widget>[

              //TOP ROW FOR LOGO
              Row(
                children: <Widget>[    Text('D',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0
                  ),),
                  Text('estini',
                    style: TextStyle(
                        fontFamily: "Montserrat",

                        fontSize: 30.0
                    ),)
                  ,
                  SizedBox(width: 200.0,),
                  Icon(Icons.home)],
              ),

              //DIALOGUE CONTAINER
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  children: <Widget>[
                    Text("-You choose your own paths and",
                    style: TextStyle(
                      color:Colors.black,
                      fontFamily: "Montserrat",
                      fontSize: 20.0
                    ),),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('create your own \"DESTINY\"',
                      style: TextStyle(
                          color:Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),


                    ),

                  ],
                ),
              ),

              //CARD FOR HITCHHIKER
              Opacity(
                opacity: 0.75,
                child:  Container(
                  height: 90.0,
                  margin: EdgeInsets.symmetric(vertical:100.0 ),

                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Colors.white,blurRadius: 2.0,offset: Offset(0.0, 1.0)),]

                  ),
                  child: Row(
                    children: <Widget>[
                      Container(

                        height: 60,
                        width:60,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(5.0))

                        ),
                        child: Icon(Icons.not_listed_location),
                      ),
                      Container(
                        padding: EdgeInsets.all(3.0),
                        margin: EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Hitchhiking',
                              style: TextStyle(
                                  fontSize: 20.0
                              ),),
                            Text('Tour car has blown a tire on a winding road  ',
                              style: TextStyle(
                                  fontSize: 10.0
                              ),),
                            Text('in the middle of nowhere with no cell phone',
                              style: TextStyle(
                                  fontSize: 10.0
                              ),),
                            Text('reception.You decide to hitchhike.',
                              style: TextStyle(
                                  fontSize: 10.0
                              ),),

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25.0),
                        child: IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: (){
                          Navigator.of(context).pushNamed('/Story1');
                        }),
                      )
                    ],
                  ),
              ))


            ],
          ),

        ),
      ),
    );
  }
}


StoryBrain storyBrain = StoryBrain();


class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("images/background2.jpg"),
        fit: BoxFit.cover,
        ),),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[


              //TOP ROW
              Row(
                children: <Widget>[    Text('D',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),),
                  Text('estini',
                    style: TextStyle(
                        fontFamily: "Montserrat",

                        fontSize: 20.0
                    ),)
                  ,
                SizedBox(width: 220.0,),
                IconButton(icon: Icon(Icons.home,color: Colors.white,), onPressed:() {Navigator.of(context).pushNamed('/');})
                
                
                ],
              ),


              //FOR STORY TEXT
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(

                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "Montserrat"
                    ),
                  ),
                ),
              ),

              //CHOICE1
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    border: Border.all(color: Colors.grey[700] ,width: 2.0)
                  ),
                  child: FlatButton(
                    onPressed: () {
                      //Choice 1 made by user.
                      setState(() {
                        storyBrain.nextStory(1);
                      });

                    },

                    child: Text(

                      storyBrain.getChoice1(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Montserrat"
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 20.0,
              ),


              //CHOICE2
              Expanded(
                flex: 2,
                 child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        border: Border.all(color: Colors.grey[700] ,width: 2.0)
                    ),
                    child: FlatButton(
                      onPressed: () {
                        //Choice 2 made by user.
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },

                      child: Text(

                        storyBrain.getChoice2(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Montserrat"
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


