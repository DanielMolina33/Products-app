// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/LoginProvider.dart';
import "package:provider/provider.dart";

// Components
import '../myClipper/Myclipper.dart';
import 'Modal.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
	TextEditingController emailController = TextEditingController();
	TextEditingController passwordController = TextEditingController();

	void showModal(Widget modal){
		showDialog(
			context: context,
			builder: (BuildContext context) {
				return modal;
			},
		);
	}

	bool validateFields(){
		final isEmailEmpty = emailController.text.isEmpty;
		final isPasswordEmpty = passwordController.text.isEmpty;

		if(isEmailEmpty || isPasswordEmpty){
		  return true;
		}

		return false;
	}

	void login(context){
		bool fieldsEmpty = validateFields();

		if(fieldsEmpty){
			showModal(
				Modal(
					title: "Advertencia",
					textContent: "Debes rellenar todos los campos",
					icon: Icons.warning,
					iconColor: Colors.orange,
				)
			);
		} else {
			final loginProvider = Provider.of<LoginProvider>(context, listen: false);
			loginProvider.signin({
				'email': emailController.text,
				'password': passwordController.text,
				'password_confirmation': passwordController.text
			}, context);
		}
	}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
  
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            const TopShape(),
            Positioned(
              top: size.height * 0.30,
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.45,
              child: SizedBox(
                height: size.height * 0.16,
                width: size.width,
                child: Stack(
                  alignment: Alignment.centerLeft, 
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: size.width * 0.90,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 10
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100)
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
														controller: emailController,
                            decoration: const InputDecoration(
                              hintText: "Correo electronico",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              prefixIcon: Icon(Icons.person),
                              border: InputBorder.none
                            )
                          ),
                          const Divider(
                            height: 20, 
                            thickness: 1, 
                            color: Colors.grey
                          ),
                          TextFormField(
														controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Contraseña",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              prefixIcon: Icon(Icons.lock),
                              border: InputBorder.none
                            ),
                          ),
                        ]
                      ),
                    ),
                    Positioned(
                      right: size.width - (size.width - 5),
                      child: ElevatedButton(
                        onPressed: (){
													login(context);
                        },
                        child: const Icon(Icons.arrow_right_alt_sharp, size: 45),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10),
                          primary: Colors.blue[300]
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.6,
              child: Container(
                alignment: Alignment.centerRight,
                width: size.width,
                padding: const EdgeInsets.only(right: 60),
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "¿Olvidó su contraseña?",
                  style: TextStyle(
                    color: Colors.black12,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.7,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text("Registro"),
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100)
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20, right: 30),
                  primary: Colors.red[900],
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                ),
              ),
            ),
            const BottomShape(),
          ],
        ),
      ),
    );
  }
}

class BottomShape extends StatelessWidget {
  const BottomShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height - 200,
      right: 0,
      child: Align(
        alignment: Alignment.bottomRight,
        child: ClipPath(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue[800]
          ),
          clipper: MyClipper('bottom')
        )
      ),
    );
  }
}

class TopShape extends StatelessWidget {
  const TopShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Align(
        alignment: Alignment.topLeft,
        child: ClipPath(
          child: Container(
            width: 250,
            height: 250,
            color: Colors.blue[800]
          ),
          clipper: MyClipper('top')
        )
      ),
    );
  }
}
