import 'package:flutter/material.dart';
import 'domain/workout.dart';

void main() => runApp(HomePage());

 
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tima Fitness',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        textTheme: TextTheme(titleMedium: TextStyle(color: Colors.black))
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
           title: Text('Tima Fitness',), leading: Icon(Icons.fitness_center),

        ),
        body: WorkoutList(),
      ),
    );
  }
}

class WorkoutList extends StatelessWidget {
 
  final workouts = <Workout>[
    Workout(title: 'Text1', author: 'Tima', description: 'Push Apps', level: 'Beginners'),
    Workout(title: 'Text2', author: 'Tima', description: 'Push Apps', level: 'Intermediate'),
    Workout(title: 'Text3', author: 'Tima', description: 'Push Apps', level: 'Advanced'),
    Workout(title: 'Text4', author: 'Tima', description: 'Push Apps', level: 'Intermediate'),
    Workout(title: 'Text5', author: 'Tima', description: 'Push Apps', level: 'Beginners'),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, i){
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Container(
                decoration: BoxDecoration(color: Color.fromARGB(50, 65, 85, 1)),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10,),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12), 
                    child: Icon(Icons.fitness_center),
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1, color: Colors.black))
                    ),
                  ),
                  title: Text('${workouts[i].title}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  subtitle: Subtitle(context, workouts[i]),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}

Widget Subtitle(BuildContext context, Workout workout){
  var color = Colors.grey;
  double indecatorLevel = 0;

  switch(workout.level){
  case 'Beginners':
    color = Colors.green;
    indecatorLevel = 0.33;
    break;
  case 'Intermediate':
    color = Colors.yellow;
    indecatorLevel = 0.66;
    break;
  case 'Advanced':
    color = Colors.red;
    indecatorLevel = 1;
    break;
  }
  
  return Row(
    children: <Widget>[
      Expanded(
        flex: 3,
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey,
          value: indecatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(
        width: 30,
        height: 20,
      ),
      Expanded(
        flex: 3,
        child: Text(workout.level, style: TextStyle(color: Colors.black),),
      )
    ],
  );
}