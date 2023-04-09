import 'package:flutter/material.dart';
import 'story_brain.dart';


void main() => runApp(AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // we are using the dark theme
      home: StoryPage(),
    );
  }
}



class StoryPage extends StatefulWidget {
  StoryBrain storyBrain = StoryBrain();
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/1.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    widget.storyBrain.getStory(),


                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      widget.storyBrain.nextStory(1);
                    });

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red),
                    foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                    shape: MaterialStateProperty.resolveWith(
                            (states) => BeveledRectangleBorder()),
                  ),
                  child: Text(
                    widget.storyBrain.getChoice1(),


                    style: TextStyle(
                      fontFamily:'PTSansNarrow',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: widget.storyBrain.buttonShouldBeVisible(),

                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        widget.storyBrain.nextStory(2);
                      });

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.blue),
                      foregroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                      shape: MaterialStateProperty.resolveWith(
                              (states) => BeveledRectangleBorder()),
                    ),
                    child: Text(

                      widget.storyBrain.getChoice2(),
                      style: TextStyle(
                        fontFamily:'PTSansNarrow',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0,
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


