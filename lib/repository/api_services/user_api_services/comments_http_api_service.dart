import 'package:mvvm_flutter/configs/api_url/api_urls.dart';
import 'package:mvvm_flutter/data/network/base_http_methods.dart';
import 'package:mvvm_flutter/data/network/network_http_methods.dart';
import 'package:mvvm_flutter/model/user/comment_list_model.dart';
import 'package:mvvm_flutter/repository/api_services/user_api_services/comments_repository.dart';

class CommentHttpApiService implements CommentRepository{

  /// BaseHttpMethods is Api methods domain Interface
  /// And NetworkHttpMethods is Api methods infrastructure
  final BaseHttpMethods _apiMethods = NetworkHttpMethods();

  /// This is comment API service method
  @override
  Future<CommentListModel?> commentList() async {
    Map<String,dynamic>? response = await _apiMethods.get(ApiUrls.comment);
    if(response != null){
      CommentListModel commentListModel = CommentListModel.fromJson(response);
      return commentListModel;
    }else{
      return null;
    }
  }
}