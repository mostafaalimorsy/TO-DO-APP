import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/contoller/cubit/cubit.dart';
import '../../contoller/cubit/states.dart';
import '../widget/TasksShowBar.dart';

class archiveScreen extends StatefulWidget {
  const archiveScreen({Key? key}) : super(key: key);

  @override
  _archiveScreenState createState() => _archiveScreenState();
}

class _archiveScreenState extends State<archiveScreen> {
  @override
  Widget build(BuildContext context) {
    AppCubit getData= AppCubit.get(context);
    return BlocConsumer <AppCubit , toDoAppStates>(
      listener: (BuildContext context, toDoAppStates state) {  },
      builder: (BuildContext context, toDoAppStates state) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return buildTaskItem(getData.archvieTasks[index] , context);
            }, itemCount: getData.archvieTasks.length, separatorBuilder: (BuildContext context, int index) {
            return SizedBox();
          },

          ),
        );
      },

    );
  }
}
