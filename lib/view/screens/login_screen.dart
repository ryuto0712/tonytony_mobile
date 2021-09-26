import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            color: Colors.black

            ),
            child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 36.0, horizontal: 24.0),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
                ),

        ),
              Expanded(
                flex: 5,
                  child: Container(
                    width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: "E-mail",
                          labelText: "E-mail",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey[600],),

                        ),
                      ),
                      SizedBox(
                        height: 20.0 ,),
                    TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFe7edeb),
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.grey[600],),
                        labelText: "Password",



                    ),
                    ),
                  ],


              ))

              ),
        ],
          ),
        ),
      ),
    );
  }
}
