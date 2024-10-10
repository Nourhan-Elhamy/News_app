abstract class SearchStates{}
class GetSearchInitialStates extends SearchStates{}
class GetSearchLoadingStates extends SearchStates{}
class GetSearchFailureStates extends SearchStates{
  final String errorMessage;
  GetSearchFailureStates({
    required this.errorMessage
});
}
class GetSearchSuccessStates extends SearchStates{}