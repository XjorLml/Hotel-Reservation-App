import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'model/email_model.dart';
import 'model/email_store.dart';
// import 'profile_avatar.dart';

class MailViewPage extends StatelessWidget {
  const MailViewPage({Key? key, 
  required this.id, 
  required this.email
  }
  )
      : super(key: key);

  final int id;
  final Email email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: double.infinity,
          child: Material(
            color: Theme.of(context).cardColor,
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(
                top: 42,
                start: 20,
                end: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MailViewHeader(email: email),
                  const SizedBox(height: 32),
                  _MailViewBody(message: email.message),
                  if (email.containsPictures) ...[
                    const SizedBox(height: 28),
                    CustomImageCarousel(
                      imageUrls: email.hotelimage,
                    ),
                  ],
                  const SizedBox(height: kToolbarHeight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MailViewHeader extends StatelessWidget {
  const _MailViewHeader({
    required this.email,
  });

  final Email email;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                email.subject,
                style: textTheme.headlineMedium!.copyWith(height: 1.1),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {
                Provider.of<EmailStore>(
                  context,
                  listen: false,
                ).currentlySelectedEmailId = -1;
                Navigator.pop(context);
              },
              splashRadius: 20,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${email.sender} - ${email.time}'),
                const SizedBox(height: 4),
                // Text(
                //   'To ${email.recipients},',
                //   style: textTheme.bodySmall!.copyWith(
                //     color: Theme.of(context)
                //         .colorScheme
                //         .onSurface
                //         .withOpacity(0.64),
                //   ),
                // ),
              ],
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(end: 4),
              // child: ProfileAvatar(avatar: email.avatar),
            ),
          ],
        ),
      ],
    );
  }
}

class _MailViewBody extends StatelessWidget {
  const _MailViewBody({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
    );
  }
}

// class _PictureGrid extends StatelessWidget {
//   const _PictureGrid(
//     {
//       required this.hotelimage
//     }
//   );
//   final List<String>hotelimage;
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 4,
//         mainAxisSpacing: 4,
//       ),
//       itemCount: hotelimage.length,
//       itemBuilder: (context, index) {
//         return Image.asset(
//           hotelimage[index],
//           gaplessPlayback: true,
//           // package: 'flutter_gallery_assets',
//           fit: BoxFit.fill,
//         );
//       },
//     );
//   }
// }

class CustomImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  CustomImageCarousel({required this.imageUrls});

  @override
  _CustomImageCarouselState createState() => _CustomImageCarouselState();
}

class _CustomImageCarouselState extends State<CustomImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  url,
                  fit: BoxFit.cover,
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageUrls.map((url) {
            int index = widget.imageUrls.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}