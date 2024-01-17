class Email {
  const Email({
    required this.sender,
    required this.time,
    required this.subject,
    required this.message,
    // required this.avatar,
    // required this.recipients,
    required this.containsPictures,
    required this.hotelimage,
  });

  final String sender;
  final String time;
  final String subject;
  final String message;
  // final String avatar;
  // final String recipients;
  final bool containsPictures;
  final List<String>hotelimage;
}
