class RegisterState{}
class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterFailureState extends RegisterState{
  final String errorMessage;
  RegisterFailureState({required this.errorMessage});
}
class RegisterSuccessState extends RegisterState{}