import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class BaseLocalized {
  String get introTitle;

  String get introText;

  String get introSetupStep11;

  String get introSetupStep12;

  String get introSetupStep21;

  String get introSetupStep22;

  String get introSetupStep31;

  String get introSetupStep32;

  String get introSetupStep41;

  String get introSetupStep42;

  String get loginTitle;

  String get loginDescription1;

  String get loginDescription2;

  String get loginDescription3;

  String get loginDescription4;

  String get loginDescription5;

  String get communityTitle;

  String get communitySearchTitle;

  String get communityCommunityTitle;

  String get communityLikes;

  String get communityAdded;

  String get communityAddToList;

  String get homeCommunity;

  String get homeReport;

  String get homeMyList;

  String get homeMore;

  String get reportDiscard;

  String get reportTitle;

  String get reportDialogTitle;

  String get reportDialogStay;

  String get reportDialogLeave;

  String get mylistTitle;

  String get mylistSearch;

  String get mylistNoItems;
}

class VILocalized extends BaseLocalized {
  @override
  String get introTitle => 'Bật chế độ chặn Spam';

  @override
  String get introText =>
      'Các số điện thoại trong danh sách đen của bạn sẽ bị chặn';

  @override
  String get introSetupStep11 => 'Mở';

  @override
  String get introSetupStep12 => ' Cài đặt Iphone';

  @override
  String get introSetupStep21 => 'Chọn';

  @override
  String get introSetupStep22 => ' Điện thoại';

  @override
  String get introSetupStep31 => 'Bật';

  @override
  String get introSetupStep32 => ' Chặn cuộc gọi & ID';

  @override
  String get introSetupStep41 => 'Bật tất cả';

  @override
  String get introSetupStep42 => ' lựa chọn [Tên App]';

  @override
  String get loginTitle => 'Kế hoạch cho cuộc gọi của bạn';

  @override
  String get loginDescription1 => 'Bằng cách đăng nhập, bạn đã đồng ý với';

  @override
  String get loginDescription2 => 'các';

  @override
  String get loginDescription3 => ' Điều khoản Dịch vụ';

  @override
  String get loginDescription4 => ' và';

  @override
  String get loginDescription5 => ' Chính sách Riêng tư';

  @override
  String get communityTitle => 'TÌM KIẾM';

  @override
  String get communitySearchTitle => 'Enter tên';

  @override
  String get communityCommunityTitle => 'Cộng đồng';

  @override
  String get communityLikes => 'thích';

  @override
  String get communityAdded => 'Đã thêm';

  @override
  String get communityAddToList => 'Thêm vào danh sách';

  @override
  String get homeCommunity => 'Cộng đồng';

  @override
  String get homeReport => 'Thêm chặn';

  @override
  String get homeMyList => 'Danh sách';

  @override
  String get homeMore => 'Khác';

  @override
  String get reportDiscard => 'Huỷ';

  @override
  String get reportTitle => 'Chặn 1 số điện thoại mới';

  @override
  String get reportDialogTitle =>
      'Dữ liệu sẽ không được lưu lại nếu bạn thoát, bạn có xác nhận thoát?';

  @override
  String get reportDialogStay => 'Ở LẠI';

  @override
  String get reportDialogLeave => 'RỜI ĐI';

  @override
  String get mylistTitle => 'Danh Sách';

  @override
  String get mylistSearch => 'Nhập Tên';

  @override
  String get mylistNoItems => 'Bạn chưa có danh sách chặn nào';
}

class ENLocalized extends BaseLocalized {
  @override
  String get introTitle => 'Turn on Spam Protection';

  @override
  String get introText => 'This will block numbers in your blocking list';

  @override
  String get introSetupStep11 => 'Open';

  @override
  String get introSetupStep12 => ' iPhone Settings';

  @override
  String get introSetupStep21 => 'Tap on';

  @override
  String get introSetupStep22 => ' Phone';

  @override
  String get introSetupStep31 => 'Turn on';

  @override
  String get introSetupStep32 => ' Call Blocking & Identification';

  @override
  String get introSetupStep41 => 'Turn on all';

  @override
  String get introSetupStep42 => ' [App Name] options';

  @override
  String get loginTitle => 'Project your phone call';

  @override
  String get loginDescription1 => 'By logging in, you agree with';

  @override
  String get loginDescription2 => 'our';

  @override
  String get loginDescription3 => ' Term of Service';

  @override
  String get loginDescription4 => ' and';

  @override
  String get loginDescription5 => ' Privacy Policy';

  @override
  String get communityTitle => 'SEARCH';

  @override
  String get communitySearchTitle => 'Enter name';

  @override
  String get communityCommunityTitle => 'Community';

  @override
  String get communityLikes => 'likes';

  @override
  String get communityAdded => 'Added';

  @override
  String get communityAddToList => 'Add to list';

  @override
  String get homeCommunity => 'Community';

  @override
  String get homeReport => 'Report';

  @override
  String get homeMyList => 'My List';

  @override
  String get homeMore => 'More';

  @override
  String get reportDiscard => 'Discard';

  @override
  String get reportTitle => 'Report a New Phone Number';

  @override
  String get reportDialogTitle =>
      'Data will not be saved if you want to leave, please confirm?';

  @override
  String get reportDialogStay => 'STAY';

  @override
  String get reportDialogLeave => 'LEAVE';

  @override
  String get mylistTitle => 'My List';

  @override
  String get mylistSearch => 'Enter name';

  @override
  String get mylistNoItems => 'You don’t have any collection in list';
}

class Localized {
  static BaseLocalized get;
  static Locale current;

  static List<Locale> locales =
      localized.keys.map((String l) => Locale(l)).toList();

  static Map<String, BaseLocalized> localized = <String, BaseLocalized>{
    'vi': VILocalized(),
    'en': ENLocalized()
  };

  static bool isSupported(Locale locale) =>
      locales.map((Locale l) => l.languageCode).contains(locale.languageCode);

  static void load(Locale locale) {
    current = locale;
    get = localized[locale.languageCode];
  }
}

class CustomLocalizationsDelegate extends LocalizationsDelegate<dynamic> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => Localized.isSupported(locale);

  @override
  Future<dynamic> load(Locale locale) {
    Localized.load(locale);
    return SynchronousFuture<dynamic>(Object());
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}
