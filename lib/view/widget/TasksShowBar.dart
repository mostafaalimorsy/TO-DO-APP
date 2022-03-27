
import 'package:flutter/material.dart';
import 'package:todoapp/contoller/cubit/cubit.dart';



  Widget buildTaskItem(Map model , context) {
    // AppCubit getData= AppCubit.get(context);
    return Card(
      color: const Color.fromRGBO(152, 186, 231, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        leading: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            AppCubit.get(context).deleteData( id: model['id']);

          },
        ),
        title: Row(
          children: [

            Text('${model['Title']}'),
            SizedBox(
              width: 5.0,
            ),
            Text('${model['date']}', style: TextStyle(fontSize: 10),),
            SizedBox(
              width: 10.0,
            ),
            Text('${model['Time']}',style: TextStyle(fontSize: 10)),
            Spacer(),
            IconButton(onPressed: (){
              AppCubit.get(context).updateData(status: 'done', id: model['id']);


              

            }, icon: const Icon(Icons.check_circle_outline_outlined),),
            Spacer(),
            IconButton(onPressed: (){
              AppCubit.get(context).updateData(status: 'archive', id: model['id']);

            }, icon: const Icon(Icons.archive_outlined),),
          ],
        ),
        subtitle: Text('${model['description']}'),

      ),
    );
  }


