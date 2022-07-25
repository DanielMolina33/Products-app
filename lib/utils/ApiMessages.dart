import 'package:flutter_app/components/Modal.dart';
import 'package:flutter/material.dart';

class ApiMessages {
  void getMessages(data, context) {
    final messages = data['message'];
    String message = "";
	
	  if(data != null){

	    if(messages is List<dynamic>){ 
        for(var item in messages) {
          message += item + "\n";
        }          
	    } else {
        message = messages.toString().replaceAll("\"", "");

        if(message == "Unauthenticated.") {
          message = message.replaceAll("Unauthenticated.", "Vuelve a iniciar sesion");
        }
      }
      
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Modal(
            title: "Advertencia", 
            textContent: message, 
            icon: Icons.warning_amber_rounded,
            iconColor: Colors.orange
          );
        }
      );
    }
  }
}