import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:reply/settings_bottom_sheet.dart';

import 'email_model.dart';

const _avatarsLocation = 'reply/avatars';

class EmailStore with ChangeNotifier {
  final _categories = <String, Set<Email>>{
    'Inbox': _mainInbox,
    'Starred': _starredInbox,
    'Sent': _outbox,
    'Trash': _trash,
    'Spam': _spam,
    'Drafts': _drafts,
  };

  static final _mainInbox = <Email>{
    const Email(
      sender: 'Ratings',
      time: '10/10',
      subject: "Shangri-La's Boracay Resort and Spa",
      message: 'Boracay Island, Malay, Aklan.\n\n'
          "Nestled on the pristine shores of Boracay's White Beach, Shangri-La's Boracay Resort and Spa epitomizes luxury and natural beauty. Exclusive villas and suites offer breathtaking ocean views. World-class dining, a rejuvenating CHI, The Spa, and a range of water sports create a tropical paradise experience. The serene ambiance and exceptional service make it an ideal haven.",
      // avatar: '$_avatarsLocation/avatar_express.png',
      // recipients: 'Jeff',
      containsPictures: true,
     hotelimage: [
        // 'http://surl.li/pizes',
        // 'http://surl.li/pizfh',
        // 'http://surl.li/pizft',
        // 'http://surl.li/pizgv',
        'images/shangrila/shangrila1.jpg',
        'images/shangrila/shangrila2.jpg',
        'images/shangrila/shangrila3.jpg',
        'images/shangrila/shangrila4.jpg'
        
      ],
    ),
    const Email(
      sender: 'Ratings',
      time: '9/10',
      subject: 'Amanpulo',
      message: 'Pamalican Island, Palawan\n\n'
          "Amanpulo stands as a secluded masterpiece on Palawan's Pamalican Island. Luxurious casitas and villas provide privacy and awe-inspiring views of the Sulu Sea. Amanpulo offers an unparalleled escape with a private white-sand beach, world-class spa treatments, and exquisite dining experiences, ensuring a truly rejuvenating retreat.",
      // avatar: '$_avatarsLocation/avatar_5.jpg',
      // recipients: 'Jeff',
      containsPictures: true,
     hotelimage: [
        'images/amanpulo/amanpulo1.jpg',
        'images/amanpulo/amanpulo2.jpg',
        'images/amanpulo/amanpulo3.jpg',
        'images/amanpulo/amanpulo4.jpg',
        'images/amanpulo/amanpulo5.jpg',
      
      ],
    ),
    const Email(
      sender: 'Ratings',
      time: '8/10',
      subject: 'The Peninsula Manila',
      message: 'Ayala Avenue, Makati City'
      "Located in the center of Makati City, The Peninsula Manila has set the benchmark for luxury and sophistication for over four decades. Known affectionately as the “Jewel in the Capital’s Crown” for its legendary presence in the heart of the Philippines’ primary business district, it is a luxurious haven of comfort, quality service and fine cuisine, and is as much a favorite with discerning locals as it is with visitors from overseas. For the second year, The Peninsula Manila is awarded the coveted Forbes Travel Guide Five-Star rating – the only hotel in the principal central business districts of Makati and Bonifacio Global City to receive the coveted ranking in the publisher’s annual announcement of the world’s finest luxury hotels.",
      // avatar: '$_avatarsLocation/avatar_3.jpg',
      // recipients: 'Jeff',
      containsPictures: true,
     hotelimage: [
        'images/peninsula/peninsula1.jpg',
        'images/peninsula/peninsula2.jpg',
        'images/peninsula/peninsula3.jpg',
        'images/peninsula/peninsula4.jpg',
        'images/peninsula/peninsula5.jpg',
        'images/peninsula/peninsula6.jpg',
      ],
    ),
    const Email(
      sender: 'Ratings',
      time: '8/10',
      subject: 'El Nido Resorts - Pangulasian Island',
      message: 'Pangulasian Island, Palawan\n\n'
          "Pangulasian Island is El Nido Resorts’ Eco-Luxury island resort in Bacuit Bay, El Nido. The resort is set fronting a pristine beach and against a backdrop of tropical forest. Also known as the “Island of the Sun”, Pangulasian has breathtaking views of both the sunrise and sunset. Frolic in the 750-meter stretch of white sand beach and be amazed by the marine sanctuary right at its doorstep. Discerning guests will be treated to luxurious amenities and impeccable and personalized service at Pangulasian Island. The resort offers a total of 42 deluxe accommodations built with contemporary Filipino and cutting edge “green” design.",
      // avatar: '$_avatarsLocation/avatar_8.jpg',
      // recipients: 'Allison, Kim, Jeff',
      containsPictures: true,
     hotelimage: [
        'images/pangulasian/pangulasian1.jpg',
        'images/pangulasian/pangulasian2.jpg',
        'images/pangulasian/pangulasian3.jpg',
        'images/pangulasian/pangulasian4.jpg',
        'images/pangulasian/pangulasian5.jpg',
        'images/pangulasian/pangulasian6.jpg',
      ],
    ),
    const Email(
      sender: 'Ratings',
      time: '7/10',
      subject: 'The Bellevue Manila',
      message: ' Alabang, Muntinlupa,\n\n'
      "You’ll find all you need here at The Bellevue Manila! Go on a gastronomic adventure with fantastic dining options, and work on your wellness with the hotel’s state-of-the-art facilities such as the spa, gym, and swimming pool. With excellent service, spacious and comfortable rooms, and top-notch facilities and amenities, this five-star hotel in Alabang promises a delightful experience for its valued guests.",
      
      // avatar: '$_avatarsLocation/avatar_express.png',
      // recipients: 'Jeff',
      containsPictures: true,
     hotelimage: [
        'images/bellevue/bellevue1.jpg',
        'images/bellevue/bellevue2.jpg',
        'images/bellevue/bellevue3.jpg',
        'images/bellevue/bellevue4.jpg',
        'images/bellevue/bellevue5.jpg',
        'images/bellevue/bellevue6.jpg',
      ],
    ),
  };

  static final _starredInbox = <Email>{};

  static final _outbox = <Email>{
    const Email(
      sender: 'Kim Alen',
      time: '4 hrs ago',
      subject: 'High school reunion?',
      message:
          'Hi friends,\n\nI was at the grocery store on Sunday night.. when I ran into Genie Williams! I almost didn\'t recognize her afer 20 years!\n\n'
          'Anyway, it turns out she is on the organizing committee for the high school reunion this fall. I don\'t know if you were planning on going or not, but she could definitely use our help in trying to track down lots of missing alums. '
          'If you can make it, we\'re doing a little phone-tree party at her place next Saturday, hoping that if we can find one person, thee more will...',
      // avatar: '$_avatarsLocation/avatar_7.jpg',
      // recipients: 'Jeff',
      containsPictures: true,
     hotelimage: [],
    ),
    const Email(
      sender: 'Sandra Adams',
      time: '7 hrs ago',
      subject: 'Recipe to try',
      message:
          'Raspberry Pie: We should make this pie recipe tonight! The filling is '
          'very quick to put together.',
      // avatar: '$_avatarsLocation/avatar_2.jpg',
      // recipients: 'Jeff',
      containsPictures: true,
     hotelimage: [],
    ),
  };

  static final _trash = <Email>{
    const Email(
      sender: 'Frank Hawkins',
      time: '4 hrs ago',
      subject: 'Your update on the Google Play Store is live!',
      message:
          'Your update is now live on the Play Store and available for your alpha users to start testing.\n\n'
          'Your alpha testers will be automatically notified. If you\'d rather send them a link directly, go to your Google Play Console and follow the instructions for obtaining an open alpha testing link.',
      // avatar: '$_avatarsLocation/avatar_4.jpg',
      // recipients: 'Jeff',
      containsPictures: true,
     hotelimage: [],
    ),
    const Email(
      sender: 'Allison Trabucco',
      time: '6 hrs ago',
      subject: 'Try a free TrailGo account',
      message:
          'Looking for the best hiking trails in your area? TrailGo gets you on the path to the outdoors faster than you can pack a sandwich.\n\n'
          'Whether you\'re an experienced hiker or just looking to get outside for the afternoon, there\'s a segment that suits you.',
      // avatar: '$_avatarsLocation/avatar_3.jpg',
      // recipients: 'Jeff',
      containsPictures: true,
     hotelimage: [],
    ),
  };

  static final _spam = <Email>{
    const Email(
      sender: 'Allison Trabucco',
      time: '4 hrs ago',
      subject: 'Free money',
      message:
          'You\'ve been selected as a winner in our latest raffle! To claim your prize, click on the link.',
      // avatar: '$_avatarsLocation/avatar_3.jpg',
      // recipients: 'Jeff',
      containsPictures: true,
     hotelimage: [],
    ),
  };

  static final _drafts = <Email>{
    const Email(
      sender: 'Sandra Adams',
      time: '2 hrs ago',
      subject: '(No subject)',
      message: 'Hey,\n\n'
          'Wanted to email and see what you thought of',
      // avatar: '$_avatarsLocation/avatar_2.jpg',
      // recipients: 'Jeff',
      containsPictures: true,
     hotelimage: [],
    ),
  };

  int _currentlySelectedEmailId = -1;
  String _currentlySelectedInbox = 'Inbox';
  bool _onCompose = false;
  bool _bottomDrawerVisible = false;
  ThemeMode _currentTheme = ThemeMode.system;
  SlowMotionSpeedSetting _currentSlowMotionSpeed =
      SlowMotionSpeedSetting.normal;

  Map<String, Set<Email>> get emails =>
      Map<String, Set<Email>>.unmodifiable(_categories);

  void deleteEmail(String category, int id) {
    final email = _categories[category]!.elementAt(id);

    _categories.forEach(
      (key, value) {
        if (value.contains(email)) {
          value.remove(email);
        }
      },
    );

    notifyListeners();
  }

  void starEmail(String category, int id) {
    final email = _categories[category]!.elementAt(id);
    var alreadyStarred = isEmailStarred(email);

    if (alreadyStarred) {
      _categories['Starred']!.remove(email);
    } else {
      _categories['Starred']!.add(email);
    }

    notifyListeners();
  }

  bool get bottomDrawerVisible => _bottomDrawerVisible;
  int get currentlySelectedEmailId => _currentlySelectedEmailId;
  String get currentlySelectedInbox => _currentlySelectedInbox;
  bool get onMailView => _currentlySelectedEmailId > -1;
  bool get onCompose => _onCompose;
  ThemeMode get themeMode => _currentTheme;
  SlowMotionSpeedSetting get slowMotionSpeed => _currentSlowMotionSpeed;

  bool isEmailStarred(Email email) {
    return _categories['Starred']!.contains(email);
  }

  set bottomDrawerVisible(bool value) {
    _bottomDrawerVisible = value;
    notifyListeners();
  }

  set currentlySelectedEmailId(int value) {
    _currentlySelectedEmailId = value;
    notifyListeners();
  }

  set currentlySelectedInbox(String inbox) {
    _currentlySelectedInbox = inbox;
    notifyListeners();
  }

  set themeMode(ThemeMode theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  set slowMotionSpeed(SlowMotionSpeedSetting speed) {
    _currentSlowMotionSpeed = speed;
    timeDilation = slowMotionSpeed.value;
  }

  set onCompose(bool value) {
    _onCompose = value;
    notifyListeners();
  }
}
