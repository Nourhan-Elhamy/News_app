
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/auth/register/data/repos/register_repo.dart';
import 'package:userapp/features/auth/register/presentation/controller/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}):super(RegisterInitialState());
 final RegisterRepo registerRepo;
  Future<void>signUpWithFirebase({
    required String email,
    required String pas,
    required BuildContext context
    })async{
    //loading
    emit(RegisterLoadingState());
    var result = await registerRepo.register(email: email, pas: pas, context: context);
    result.fold((left) =>
    {
      emit(RegisterFailureState(errorMessage: left.message))
    },
            (right) => {
      emit(RegisterSuccessState())
            });

}



Future<void> signUpWithGoogle() async{
emit(RegisterLoadingState());
var result = await registerRepo.signInWithGoogle();
result.fold((left) {
  emit(RegisterFailureState(errorMessage: left.message));

},
        (r) {
  emit(RegisterSuccessState());
        });

}


}