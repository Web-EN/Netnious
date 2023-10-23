import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/utils.dart';

class Scene extends StatefulWidget {
  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  String _mensajeTextField = "";


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
      child:Container(
        width: 377,
        height: 168,
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
          child: Text(
                      'Escribe algun mensaje....',
                      textAlign: TextAlign.start,
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.1725*ffem/fem,
                        color: Color(0x7f000000),
                      ),
                    ),
                )
                )
                
                ])
                ));
                
    }
  }