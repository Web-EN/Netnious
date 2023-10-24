import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/utils.dart';

class Scene extends StatefulWidget {
  @override
  _SceneState createState() => _SceneState();
}


class _SceneState extends State<Scene> {
  String _mensajeTextField = '';
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage(){
    final message = _messageController.text;
    if (message.isNotEmpty){
      _showNotification(context, 'Mensaje enviado');
    }
    else{
      _showNotification(context, 'Completa el mensaje');
    }
  }

  void _showNotification(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notificación'),
          content: Text(message, style: SafeGoogleFont(
            'Roboto',fontSize: 22
          )),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 932 * fem,
        decoration: BoxDecoration(
          color: Color(0xffebebeb),
        ),
            child: Stack(
              children: [
                Positioned(
                  left:24*fem,
                  top: 100*fem,
              child: Text(
                'Mensajes y anuncios',
                style: SafeGoogleFont (
                  'Roboto',
                  fontSize: 22*ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.1725*ffem/fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
              Positioned(
                left: 24 * fem,
                top: 132 * fem,
                child: SizedBox(
                  width: 377*fem,
                  height: 168*fem,
                  child: Container(
                             decoration: ShapeDecoration(
                    color: Color(0xFFF7D7CD),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 20*fem,
                              ),
                              maxLines: null,
                              minLines: null,
                              expands: true,
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: 'Escribe algun mensaje...',
                              ),
                            )
                          )
                )
                      ),
                      Positioned(
                        left: 294*fem,
                        top: 325*fem,
                        child: Container(
                          height: 33*fem,
                          width: 107*fem,
                          child: ElevatedButton(
                          onPressed: _sendMessage ,
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            primary: Color(0xFFF7D7CD),
                          ),
                          child: Text(
                            'Notificar',
                            style: SafeGoogleFont(
            'Roboto',fontSize: 18*fem
                  )
                          ),
                        ),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 16.0),
                            Text(
                              _mensajeTextField,
                              style: TextStyle(
                              color: _mensajeTextField == 'Mensaje enviado' ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                    ),
              ]
                  ),
                )
              );
  }
}