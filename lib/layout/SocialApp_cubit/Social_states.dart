abstract class Social_App_States{}

 class SocialIntialState extends Social_App_States{}

 class GetUserDataLoadingState extends Social_App_States{}

 class GetUserDatasuccessState extends Social_App_States{}

 class GetUserDataErrorState extends Social_App_States{

  final String error;
  GetUserDataErrorState(this.error);

 }
 class GetCommentsuccessState extends Social_App_States{}

 class GetCommentErrorState extends Social_App_States{

  final String error;
  GetCommentErrorState(this.error);

 }


class GetPostLoadingState extends Social_App_States{}

class GetPostsuccessState extends Social_App_States{}

class GetPostErrorState extends Social_App_States{

 final String error;
 GetPostErrorState(this.error);

}
class GetAllUsersLoadingState extends Social_App_States{}

class GetAllUserssuccessState extends Social_App_States{}

class GetAllUsersErrorState extends Social_App_States{

 final String error;
 GetAllUsersErrorState(this.error);

}


class PostLikesuccessState extends Social_App_States{}

class PostLikeErrorState extends Social_App_States{

 final String error;
 PostLikeErrorState(this.error);

}

class PostCommentssuccessState extends Social_App_States{}

class PostCommentsErrorState extends Social_App_States{

 final String error;
 PostCommentsErrorState(this.error);

}
class SocialChangeNavBarState extends Social_App_States{}

class SocialNewPostState extends Social_App_States{}

class PickedProfileImageSuccessState extends Social_App_States{}

class PickedProfileImageErrorState extends Social_App_States{}

class PickedCoverImageSuccessState extends Social_App_States{}

class PickedCoverImageErrorState extends Social_App_States{}

class UpdateprofileImageSucessState extends Social_App_States{}

class UpdateprofileImageErrorState extends Social_App_States{}

class UpdateCoverImageSucessState extends Social_App_States{}

class UpdateCoverImageErrorState extends Social_App_States{}

class UpdateUserDataLoadingState extends Social_App_States{}

class UpdateUserDataProfileImageLoadingState extends Social_App_States{}

class UpdateUserDataCoverImageLoadingState extends Social_App_States{}

class UpdateUserDataErrorState extends Social_App_States{}

class PostCreateLoadingState extends Social_App_States{}

class PostCreateSuccessState extends Social_App_States{}

class PostCreateErrorState extends Social_App_States{}

class UpdatePostImageLoadingState extends Social_App_States{}


class UpdatePostImageSucessState extends Social_App_States{}

class UpdatePostImageErrorState extends Social_App_States{}

class PickedPostImageSuccessState extends Social_App_States{}

class PickedPostImageErrorState extends Social_App_States{}

class CreatePostLoadingState extends Social_App_States{}

class CreatePostSuccessState extends Social_App_States{}

class CreatePostErrorState extends Social_App_States{}

class RemovePostSuccessState extends Social_App_States{}

class GetmessageErrorState extends Social_App_States{}

class GetmessageSuccessState extends Social_App_States{}

class GetAllmessageSuccessState extends Social_App_States{}
class ChangepostindexSuccessState extends Social_App_States{}
