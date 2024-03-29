import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodapp/global.dart';
import '../../../common/entities/user.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)

class HomeScreenBannerDots extends _$HomeScreenBannerDots{
  @override
  int build()=>0;
  void setIndex(int value){
    state = value;

  }
}

@riverpod
class HomeUserProfile extends _$HomeUserProfile{

  @override
  FutureOr<UserProfile>build(){
    return Global.storageService.getUserProfile();
  }
}