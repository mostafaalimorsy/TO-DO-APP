import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/contoller/cubit/cubit.dart';
import 'package:todoapp/view/screen/basescreen.dart';
import 'package:todoapp/view/screen/fristscreen.dart';
import '../../contoller/CreateDataBase.dart';

class addScreen extends StatefulWidget {
  const addScreen({Key? key}) : super(key: key);

  @override
  _addScreenState createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  var timeController=TextEditingController();
  var dateController=TextEditingController();

 // key scafoldKey= ;



  @override
  Widget build(BuildContext context) {
    AppCubit getData= AppCubit.get(context);
    return Card(
      color: const Color.fromRGBO(152, 186, 231, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            //title
            TextFormField(

              keyboardType: TextInputType.text,
              controller: titleController,
              maxLines: 1,
              decoration: const InputDecoration(

                labelText: "Title",
                hintText: "Enter Title",
              ),
            ),
            //description
            TextFormField(


              keyboardType: TextInputType.text,
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
                hintText: "Enter Description",
              ),
            ),
            //data
            TextFormField(


              controller: dateController,
              keyboardType: TextInputType.datetime,
              //controller: dateTimeController,
              onTap: () {
                showDatePicker(context: context, initialDate:DateTime.now() , firstDate:DateTime.now() , lastDate:DateTime.parse('2525-12-30') ).then((value) {
                  dateController.text= DateFormat.yMMMEd().format(value!);
                });


              },

              decoration: const InputDecoration(
                labelText: "Date",
                hintText: "Enter Date",
              ),
            ),
            // time
            TextFormField(


              keyboardType: TextInputType.datetime,
              controller: timeController,

              onTap: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                  timeController.text = value!.format(context).toString();
                });

              },

              decoration: const InputDecoration(
                labelText: "Time",
                hintText: "Enter Time",
              ),
            ),
            //save button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Colors.blueAccent,
                  onPressed: () {

                    getData.InsertToDataBase(
                        date: dateController.text,
                        title: titleController.text,
                        time: timeController.text,
                        description: descriptionController.text
                    );
                    getData.currentIndex=0;




                  },
                  child: Icon(
                    Icons.save,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
