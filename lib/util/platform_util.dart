import 'package:flutter_web_auto_package/util/screen_util.dart';
import 'package:universal_html/html.dart';

class PlatformUtil {
  ///根据ua来判断是否为手机端
  static bool isMobile() {
    return window.navigator.userAgent.contains('Android') ||
        window.navigator.userAgent.contains('iPhone');
  }

  ///判断是否为平板
  static bool isTablet() {
    print('${ScreenUtil.screenWidth()},${window.navigator.userAgent}');
    if (isMobile()) {
      if (ScreenUtil.screenWidth() < ScreenUtil.screenWidth()) {
        return true;
      }
    }
    return false;
  }
}
