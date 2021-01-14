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

  String get reportAddToCollection;

  String get reportDescription;

  String get reportCharacters;

  String get reportAddDescription;

  String get reportPhoneNumber;

  String get mylistTitle;

  String get mylistSearch;

  String get mylistNoItems;

  String get mylistUnblock;

  String get mylistViewDetail;

  String get moreAboutUs;

  String get moreFeedback;

  String get moreRateTheApp;

  String get moreLogOut;

  String get moreVersion;

  String get feedbackTitle;

  String get feedbackText;

  String get feedbackRequied;

  String get feedbackEnterEmail;

  String get feedbackEnterFeedback;

  String get feedbackBack;

  String get myCollectionPeopleReport;

  String get myCollectionMyCollection;

  String get myCollectionText;

  String get myCollectionDialogTitle;

  String get myCollectionDialogCancel;

  String get update;

  String get updateMinutes;

  String get updateHours;

  String get updateDays;
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
  String get introSetupStep42 => ' lựa chọn [Tên ứng dụng]';

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
  String get communitySearchTitle => 'Nhập tên';

  @override
  String get communityCommunityTitle => 'Cộng đồng';

  @override
  String get communityLikes => 'thích';

  @override
  String get communityAdded => 'Đã thêm';

  @override
  String get communityAddToList => 'Thêm danh sách';

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
  String get reportDialogStay => 'Tiếp tục';

  @override
  String get reportDialogLeave => 'Thoát';

  @override
  String get reportAddToCollection => 'Thêm vào danh sách';

  @override
  String get reportDescription => 'Mô tả';

  @override
  String get reportCharacters => 'Kí tự';

  @override
  String get reportAddDescription => 'Nhập mô tả';

  @override
  String get reportPhoneNumber => 'Số điện thoại';

  @override
  String get mylistTitle => 'Danh Sách';

  @override
  String get mylistSearch => 'Nhập Tên';

  @override
  String get mylistNoItems => 'Bạn chưa có danh sách chặn nào';

  @override
  String get mylistUnblock => 'Bỏ chặn';

  @override
  String get mylistViewDetail => 'Danh sách chặn chi tiết';

  @override
  String get moreAboutUs => 'Thông tin về chúng tôi';

  @override
  String get moreFeedback => 'Phản hồi';

  @override
  String get moreRateTheApp => 'Đánh giá ứng dụng';

  @override
  String get moreLogOut => 'Thoát';

  @override
  String get moreVersion => 'Phiên bản 1.0';

  @override
  String get feedbackTitle => 'Phản Hồi';

  @override
  String get feedbackText =>
      'Chúng tôi không ngừng phát triển ứng dụng hoàn thiện hơn';

  @override
  String get feedbackRequied => 'Bắt buộc';

  @override
  String get feedbackEnterEmail => 'Nhập Email';

  @override
  String get feedbackEnterFeedback => 'Nhập phản hồi';

  @override
  String get feedbackBack => 'Quay lại';

  @override
  String get myCollectionPeopleReport => 'người đã bị chặn';

  @override
  String get myCollectionMyCollection => 'Danh sách của tôi';

  @override
  String get myCollectionText =>
      'Đây là danh sách các số điện thoại bạn đã báo cáo là spam';

  @override
  String get myCollectionDialogTitle =>
      'Bạn có chắc rằng bạn muốn bỏ chặn không?';

  @override
  String get myCollectionDialogCancel => 'huỷ';

  @override
  String get update => 'Cập nhật';

  @override
  String get updateMinutes => 'phút trước';

  @override
  String get updateHours => 'giờ trước';

  @override
  String get updateDays => 'ngày trước';
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
  String get reportAddToCollection => 'Add to collection';

  @override
  String get reportDescription => 'Description';

  @override
  String get reportCharacters => 'characters';

  @override
  String get reportAddDescription => 'Type to add description';

  @override
  String get reportPhoneNumber => 'Phone Number';

  @override
  String get mylistTitle => 'My List';

  @override
  String get mylistSearch => 'Enter name';

  @override
  String get mylistNoItems => 'You don’t have any collection in list';

  @override
  String get mylistUnblock => 'UnBlock';

  @override
  String get mylistViewDetail => 'View Details';

  @override
  String get moreAboutUs => 'about us';

  @override
  String get moreFeedback => 'feedback';

  @override
  String get moreRateTheApp => 'rate the app';

  @override
  String get moreLogOut => 'log out';

  @override
  String get moreVersion => 'Version 1.0';

  @override
  String get feedbackTitle => 'Feedback';

  @override
  String get feedbackText =>
      'Data will not be saved if you want to leave, please confirm';

  @override
  String get feedbackRequied => 'required';

  @override
  String get feedbackEnterEmail => 'Enter Your Email';

  @override
  String get feedbackEnterFeedback => 'Type to add feedback';

  @override
  String get feedbackBack => 'Back';

  @override
  String get myCollectionPeopleReport => 'people has reported';

  @override
  String get myCollectionMyCollection => 'My Collection';

  @override
  String get myCollectionText =>
      'This is a list of your reported spam phone numbers';

  @override
  String get myCollectionDialogTitle =>
      'Are you sure that  you want to unblock ?';

  @override
  String get myCollectionDialogCancel => 'CANCEL';

  @override
  String get update => 'update';

  @override
  String get updateMinutes => 'minutes ago';

  @override
  String get updateHours => 'hours ago';

  @override
  String get updateDays => 'days ago';
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
