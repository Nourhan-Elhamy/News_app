abstract class TopHeadlineStates{}
class GetTopHeadlineInitialStates extends TopHeadlineStates{}
class GetTopHeadlineLoadingStates extends TopHeadlineStates{}
class GetTopHeadlineFailureStates extends TopHeadlineStates{
  final String errorMessage;
  GetTopHeadlineFailureStates({
    required this.errorMessage
});
}
class GetTopHeadlineSucessStates extends TopHeadlineStates{}