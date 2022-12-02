
import 'package:bible_quiz/database/category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCategoryPage extends StatefulWidget{
  MyCategoryPage({Key? key,required this.title}):super(key:key);
  final String title;

  @override
  State<StatefulWidget> createState() => _MyCategoryPageState();

}

class _MyCategoryPageState extends State<MyCategoryPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getCategories(),
        builder: (context, snapshot){
          if(snapshot.hasError)
            return Center(child: Text('${snapshot.error}'),);
          else if(snapshot.hasData)
    {
    //if snapshot has data, that means Categories load success
    // so we will add more category with name " Exam" to let user to do quiz
    // all categories when click read more, help user learn from quiz
    // only exam category hel[p user make a quiz
    Category category = new Category();
    category.ID = -1;
    category.name = "Exam";
    snapshot.data.add(category);
    return GridView.count(
    crossAxisCount: 2,
    childAspectRatio: 1.0,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children: snapshot.data.map((category){
    return GestureDetector(child: Card(
    elevation: 2,
    color: category.ID == 1? Colors.green : Colors.white,
    child: Column(

    ),
    ),);
    }).toList(),
    );
    }
    },
    );

  }
}