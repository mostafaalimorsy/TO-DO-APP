import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/contoller/CreateDataBase.dart';
import 'package:todoapp/contoller/cubit/cubit.dart';
import 'package:todoapp/contoller/cubit/states.dart';
import '../widget/TasksShowBar.dart';



class fristScreen extends StatefulWidget {
  const fristScreen({Key? key}) : super(key: key);

  @override
  _fristScreenState createState() => _fristScreenState();
}

class _fristScreenState extends State<fristScreen> {

  @override
  Widget build(BuildContext context) {
    AppCubit getData= AppCubit.get(context);

    return BlocConsumer<AppCubit , toDoAppStates>(
      listener: (BuildContext context, toDoAppStates state) {  },
      builder: (BuildContext context, toDoAppStates state) {
       return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return buildTaskItem(getData.newTasks[index], context);
            }, itemCount: getData.newTasks.length, separatorBuilder: (BuildContext context, int index) {
            return SizedBox();
          },

          ),
        );
      },

    );

  }
}

