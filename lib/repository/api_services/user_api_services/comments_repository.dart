import 'package:mvvm_flutter/model/user/comment_list_model.dart';

abstract class CommentRepository {

  /// This interface method is created
  /// For get all comment list data from server
  /// Which is implemented in comment Http Api service class
  Future<CommentListModel?> commentList();

}