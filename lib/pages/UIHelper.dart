import 'package:flutter/material.dart';

 // ignore: non_constant_identifier_names
 CustomAlertBox(BuildContext context,String text){
    return showDialog(context: context,builder:(BuildContext context){
        return AlertDialog(
            title:Text(text),
        );
    });
}