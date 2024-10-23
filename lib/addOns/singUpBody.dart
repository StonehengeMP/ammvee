import 'package:ammvee_release/addOns/Already_Account.dart';
import 'package:ammvee_release/addOns/Rounded_Button.dart';
import 'package:ammvee_release/addOns/Rounded_Password_Field.dart';
import 'package:ammvee_release/addOns/isLoading.dart';
import 'package:ammvee_release/addOns/rounded_input_field.dart';
import 'package:ammvee_release/logIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ammvee_release/addOns/themeColors.dart';

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
                RoundedButton(
                  color: kBlue,
                  text: "Sign Up",
                  press: () async {
                    if (firstPassword == "" || secondPassword == "" || correo == "") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("All fields must be filled!"),
                      ));
                    }else{
                      if(secondPassword != firstPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Passwords do not match!"),
                        ));
                      }else{
                        try {
                          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: correo,
                            password: firstPassword,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Welcome"),
                          ));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Passwords is too weak!"),
                            ));
                          } else if (e.code == 'email-already-in-use') {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Account already exist for this mail!"),
                            ));
                          }
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Error, internet may be slow try again later!"),
                          ));
                        }
                      }
                    }
                  },
                ),
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
