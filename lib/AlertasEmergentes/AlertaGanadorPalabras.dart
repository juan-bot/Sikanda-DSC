import 'package:flutter/material.dart';
class ShowAlertAndAutoDismiss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('building ShowAlertAndAutoDismiss');
    Future.delayed(Duration(milliseconds: 1000)).then((_) {
      print('ziiiip');
    });
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))
      ),
      title: Center(
          child: Text("Felicidades!!!",
              style: TextStyle(
                fontSize: 20,
              ))),
      actions: <Widget>[

        Center(
            child: Text("Bien jugado",
                style: TextStyle(
                  fontSize: 20,
                ))),
        TextButton(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.teal),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(10)),
              foregroundColor:
              MaterialStateProperty.all<Color>(Colors.teal),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      side: BorderSide(color: Colors.teal)))),
          child: Text('Volver al inicio',
              style:TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
  void alertToDismiss(BuildContext context ){
    showDialog(
        context: context, builder: (context) => ShowAlertAndAutoDismiss());
  }
}
