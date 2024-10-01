import 'package:ammvee_release/addOns/Already_Account.dart';
import 'package:ammvee_release/addOns/Rounded_Button.dart';
import 'package:ammvee_release/addOns/Rounded_Password_Field.dart';
import 'package:ammvee_release/addOns/isLoading.dart';
import 'package:ammvee_release/addOns/rounded_input_field.dart';
import 'package:ammvee_release/logIn.dart';
import 'package:flutter/material.dart';

class singUpBody extends StatefulWidget {
  const singUpBody({Key? key}) : super(key: key);

  @override
  State<singUpBody> createState() => _singUpBodyState();
}

class _singUpBodyState extends State<singUpBody> {

    String firstPassword = "";
    String secondPassword = "";
    String correo = "";
    bool loading = false;

  @override
  Widget build(BuildContext context) => loading
      ? const isLoading()
      : PopScope(
        canPop: false,
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backgroundmain.png"),
                  fit: BoxFit.fill
              ),
            ),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
          child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                RoundedInputField(
                    hintText: "Correo Electrónico",
                    onChanged: (value) {
                      correo = value;
                    }
                ),
                RoundedPasswordField(
                  onChanged: (password) {
                    setState(() {
                      firstPassword = password;
                    });
                  }
                ),
                RoundedPasswordField(
                    onChanged: (confirmPassword) {
                      setState(() {
                        secondPassword = confirmPassword;
                      });
                    }
                ),
                RoundedButton(text: "Registrarse", press:() {
                  if(firstPassword != secondPassword){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Contraseñas no coinciden."),
                      backgroundColor: Colors.red,
                    ));
                  }else if(correo == ""){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Favor de ingresar un correo."),
                  backgroundColor: Colors.red,
                    ));
                  }else{
                    //TODO: Agarrar lista de correos que se pueden dar de alta
                    //TODO Dar de alta el usuario en DB
                  }
                }),
                    AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return logIn();
                              },
                            ),
                          );
                        })
                  ],
            ),
          ),
              ),
        ),
      );

}
