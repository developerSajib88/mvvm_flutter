import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_flutter/data/response/api_response.dart';
import 'package:mvvm_flutter/model/user/comment_list_model.dart';
import 'package:mvvm_flutter/repository/api_services/user_api_services/comments_repository.dart';

class CommentsViewModel extends ChangeNotifier {

  final CommentRepository commentRepository;

  CommentsViewModel({required this.commentRepository});

  ApiResponse<CommentListModel> commentList = ApiResponse.loading();

  /// This method I was created for comment List state update
  void setCommentList (ApiResponse<CommentListModel> response){
    commentList = response;
    notifyListeners();
  }

  /// This function is called
  /// For fetching comment from server
  Future<void> getCommentList() async {

    setCommentList(ApiResponse.loading());

    commentRepository.commentList().then((value) {
      if(value != null){
        setCommentList(ApiResponse.completed(value));
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setCommentList(ApiResponse.error(error.toString()));
    });

  }

}