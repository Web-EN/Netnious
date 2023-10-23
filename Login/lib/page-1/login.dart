import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Scene extends StatefulWidget {
  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  String _usuarioTextField = "";
  String _passwordTextField = "";
  bool _obscureText =
      true; // Variable para rastrear la visibilidad de la contraseña

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
              left: 52 * fem,
              top: 325 * fem,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(16 * fem, 0 * fem, 16 * fem, 0 * fem),
                width: 325 * fem,
                height: 107 * fem,
                child: SafeArea(
                  child: Scaffold(
                    body: Column(children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Usuario',
                        ),
                        onChanged: (usuario) {
                          setState(() {
                            _usuarioTextField = usuario;
                          });
                        },
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 52 * fem,
              top: 429 * fem,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(15 * fem, 0 * fem, 15 * fem, 0 * fem),
                width: 325 * fem,
                height: 107 * fem,
                child: Container(
                  child: SafeArea(
                    child: Scaffold(
                      body: Row(children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Contraseña',
                            ),
                            obscureText:
                                _obscureText, // Utiliza _obscureText aquí
                            onChanged: (password) {
                              setState(() {
                                _passwordTextField = password;
                              });
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: _togglePasswordVisibility,
                          child: Text(_obscureText ? 'Mostrar' : 'Ocultar'),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                left: 62 * fem,
                top: 273 * fem,
                child: Container(
                  width: 100 * fem,
                  height: 50 * fem,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 9),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1 * fem),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
              left: 140 * fem,
              top: 566 * fem,
              child: ElevatedButton(
                onPressed: () {
                  if (_usuarioTextField.isEmpty || _passwordTextField.isEmpty) {
                    final snackBar = SnackBar(
                      content: Text(
                          'Los campos de usuario y contraseña son obligatorios.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    login();
                  }
                },
                child: Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff1e1e1e),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5 * fem),
                      side: BorderSide(color: Color(0xff1e1e1e)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                left: 65 * fem,
                top: 42 * fem,
                child: Align(
                  child: SizedBox(
                    width: 298 * fem,
                    height: 261 * fem,
                    child: Image.asset(
                      'assets/page-1/images/ingeniuslogo-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Positioned(
              // vector1G2W (3:103)
              left: 0 * fem,
              top: 652 * fem,
              child: Align(
                child: SizedBox(
                  width: 432 * fem,
                  height: 286 * fem,
                  child: Image.asset(
                    'assets/page-1/images/vector-1.png',
                    width: 432 * fem,
                    height: 286 * fem,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    final url = Uri.parse('http://localhost:3000/login');

    final response = await http.post(
      url,
      body: {
        'username': _usuarioTextField, //Envía el nombre de usuario
        'password': _passwordTextField, //Envía la contraseña
      },
    );

    if (response.statusCode == 200) {
      final token = response.body;
      //Guarda el token si la conexión fue exitosa
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Información incorrecta'),
        ),
      );
    }
  }
}
