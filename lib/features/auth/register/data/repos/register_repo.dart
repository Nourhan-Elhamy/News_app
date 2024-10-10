import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/failure.dart';


abstract class RegisterRepo {


 Future<Either<Failure ,void>>  register( {
  required String email ,
  required String pas ,
  required BuildContext context
 });



 Future<Either<Failure ,void>> signInWithGoogle( );


}