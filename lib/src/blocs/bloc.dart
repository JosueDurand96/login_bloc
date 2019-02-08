import 'dart:async';
import './validators.dart';
import 'package:rxdart/rxdart.dart';

//conectar a validadores mediante mixings --- reutilizar el codigo de una clase en multiples jerarquia de clases
class Bloc with Validators {
  final _emailController =  StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //agregando data al stream //add data to stream

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //recuperar data del stream //retrive data from stream

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password,(e,p) => true);

  //deshacer cuando no lo utilizamos
  void dispose(){
    _emailController.close();
    _passwordController.close();
  }
}

//singled global instance
//scoped global instance

final bloc = Bloc();
