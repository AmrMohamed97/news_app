import 'package:flutter/material.dart';
//-------------------------------------------------------------Separator_builder
Widget mySeparator()=>Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child:   Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey,
  ),
);
//------------------------------------------------------------------------------
void navigateTo(context , widget)=>Navigator.push(
  context,
  MaterialPageRoute(
    builder:(context)=> widget,
  ),
);
//-----------------------------------------------------------navigate_and_finish
void navigateAndFinish({required BuildContext context,required Widget route})=>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context)=> route,
      ),
          (route) => false,
    );
//---------------------------------------------------------enum_with_switchCases
enum SnackBarState{ success,error,warning;}
Color snackColor(SnackBarState state){
  Color color;
  switch(state){
    case  SnackBarState.success:
      color= Colors.green;
      break;
    case SnackBarState.error:
      color= Colors.red;
      break;
    case SnackBarState.warning:
      color= Colors.amber;
      break;
  }
  return color;
}
