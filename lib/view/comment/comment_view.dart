import 'package:flutter/material.dart';
import 'package:mvvm_flutter/configs/component/internet_exception_widget.dart';
import 'package:mvvm_flutter/configs/component/loading_widget.dart';
import 'package:mvvm_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:mvvm_flutter/data/response/status.dart';
import 'package:mvvm_flutter/view_model/comments/comments_view_model.dart';
import 'package:provider/provider.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ChangeNotifierProvider(
          create: (context)=> CommentsViewModel(commentRepository: getIt())..getCommentList(),
          child: Consumer<CommentsViewModel>(
              builder: (BuildContext context, value, Widget? child){
                switch(value.commentList.status){
                  case Status.loading:
                    return const Center(child: LoadingWidget());
                  case Status.error:
                    return InterNetExceptionWidget(onPress: (){});
                  case Status.completed:
                    if(value.commentList.data!.comments!.isEmpty){
                      return const Center(child: Text('No data found'));
                    }else{
                      return ListView.builder(
                        itemCount: value.commentList.data?.comments?.length,
                          itemBuilder: (context,index){
                          return Container();
                        }
                      );
                    }
                  default:
                    return Container();
                }
              }
          ),
        ),
      ),
    );
  }
}
