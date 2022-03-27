import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp/contoller/CreateDataBase.dart';
import 'package:todoapp/contoller/cubit/cubit.dart';
import 'package:todoapp/contoller/cubit/states.dart';


class BaseScreen extends StatelessWidget {



  // @override
  // void initState() {
  //
  //   super.initState();
  //   CreateDataBase();
  // }

  @override
  Widget build(BuildContext context) {


    return BlocProvider(

      create: (BuildContext context) => AppCubit()..CreateDataBase(),
      child: BlocConsumer<AppCubit , toDoAppStates >(
        listener: (BuildContext context, toDoAppStates state ) {  },
        builder: (BuildContext context, toDoAppStates state ) {
          AppCubit getData= AppCubit.get(context);
         return Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
            title: Text(getData.titels[getData.currentIndex]),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 60,
            index: AppCubit.get(context).currentIndex,
            backgroundColor: Colors.blueAccent,
            items: const <Widget>[
              Icon(Icons.list, size: 25),
              Icon(Icons.check, size: 25),
              Icon(Icons.archive_outlined, size: 25),
              Icon(Icons.add, size: 25),
            ],
            onTap: (index) {
              getData.changeIndex(index);

              // setState(() {
              //   currentIndex=index;
              // });
            },
          ),
          body:   getData.screens[getData.currentIndex],

        ); }

      ),
    );
  }


}







