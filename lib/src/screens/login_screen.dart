import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          SizedBox(height: 20.0,
          ),
          submitButton(),
        ],
      ),

    );
  }
  Widget emailField(){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context,snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'josue@gmail.com',
              labelText: 'Email Address',
              errorText: snapshot.error,
          ),
        );
      },
    );

  }
  Widget passwordField(){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context,snapshot){
        return TextField(
          //Pasamos la info de ese evento a changePassword
          //introduce el valor
          onChanged: bloc.changePassword,
          //TODO: esta propiedad no permite que se lea la contraseña
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Paswword',
            errorText: snapshot.error,
          ),
        );
      }
    );
  }



  Widget submitButton(){
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context,snapshot){
        return RaisedButton(
          shape: StadiumBorder(),
          child: new Text(
            'Login',style: TextStyle(color: Colors.white),
          ),
          color: Colors.lightBlue,
          onPressed: snapshot.hasData ?  bloc.submit () : null,
          //onPressed: snapshot.hasData ? bloc.submit() : null,

        );
      }
    );

  }
}