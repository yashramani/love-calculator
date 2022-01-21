import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:love_count/commonWidget/imageContainer.dart';

class LoveQuotes extends StatefulWidget {
  const LoveQuotes({Key? key}) : super(key: key);

  @override
  _LoveQuotesState createState() => _LoveQuotesState();
}

class _LoveQuotesState extends State<LoveQuotes> {

  List quatos = [
    'You paint my world with bright colours and bring meaning to my life.',
    'You light up my day and spark up my soul.',
    'My success means nothing without you in my life.',
    'Whenever I look into your eyes, I feel the same way as I felt on the day we first met and I looked into your eyes.',
    'You’re my girl who made my life better. I love you, my dearest.',
    'I love you in a way I can never love anyone. You make my life worth living.',
    'You’re the love of my life and I can’t imagine living in this world without you.',
    'You brighten up my day just like how the sun lights up the earth.',
    'I am blessed to have you by my side and I could never imagine having anyone else in my life. I need you with me, always and forever.',
    'I know I can say anything in front of you, and you will never judge me. Thank you for being with me, my heart will always belong to you.',
    'No matter how many challenges come in my life, I will face them without difficulty if I have your support.',
    'I am taken by the most beautiful woman in my life. I Love you!',
    'You’re the best gift I’ve ever received in my life and it is because of you that I want to work hard and move forward in my life.',
    'I want to grow old with you and spend the rest of my life just like how we vowed to. I can never imagine a perfect soulmate besides you and I mean it.',
    'When you smile at me, my heart skips a beat and urges me to shower my affection on you.',
    'My love for you is boundless. I love you to the moon and back.',
    'Your kiss mends my heart, your touch lights up my soul, and your presence makes a difference to my world.',
    'I cannot imagine my world without you my dearest. You belong with me, love you.',
    'You’re a breath of fresh air and you make my days perfect. I cherish you and really love you.',
    'I always want to come home to you; ask you about your day and tell you about mine. I want you every day because I want to come home to you.',
    'Our marriage is our sacred bond – one that symbolizes love, hope, and the strength to overcome any obstacles.',
    'We are a team and there is no “we” without you. I truly love you.',
    'You’re my Goddess, my hope, my joy, and my life. Please be with me forever, my love.',
    'My unending love for you is my vision, my hope, my goal, and my soul.',
    'There is only one happiness in this life, to love and be loved.',
    'Love is the strongest force the world possesses, and yet it is the humblest imaginable.',
    'Love isn’t something you find. Love is something that finds you.',
    'What I love most about my home is who I share it with.',
    'Ever thine, ever mine, ever ours.',
    'Where there is great love, there are always miracles.',
    'Love is like the wind, you can’t see it but you can feel it.',
    'The taste of love is sweet, when hearts like ours meet.',
    'My most brilliant achievement was my ability to be able to persuade my wife to marry me.',
    'True love stories never have endings.',
    'Every love story is beautiful, but ours is my favourite.',
    'Grow old with me! The best is yet to be.',
    'You had me at hello.',
    'My love is selfish. I cannot breathe without you.',
    'In case you ever foolishly forget: I am never not thinking of you.',
    'I dreamt that you were mine, and then I woke up smiling because I realized it was not a dream. You are already mine!',
    'You fill all the emptiness in my heart. I’m so thankful to have you in my life. I love you very much!',
    'You are that woman who transformed my imperfections into perfections, just by the touch of your love. Love you my dearest wife!',
    'Your heart is full of love and affection. Your hands are always caring. I am lucky to have you as my wife.',
    'No greater light illuminates my path than the love and change you have brought into my life. Thanks, my love.',
    'I would rather spend one lifetime with you, than face all the ages of the world alone. Love you, my dear.',
    'When I look at you I wonder if I did something really good to get such a marvelous gift from God. You have been a blessing in my life and this is just to say I love you.',
    'With you I can be my silliest best and never worry about being judged, because you are my better half in the truest sense. I love you!',
    'No matter how many years pass by in our marriage, there will be two moments when I will like to be with you – Now and Forever! Love you, my sweetie.',
    'Even the silent moments we share together have the power to drown all of life’s chaos. That is why we make a great team, honey.',
    'You are a special gift from the heavens. Your smile warms my heart and your presence makes me whole. I love you, today and forever!',
    'My permanent relationship status – taken forever by the most gorgeous woman in this universe. Love ya!',
    'You make my heart melt, and fill it with love. When you gaze at me I get addicted to you! I love you so much my dear wife!',
    'I love looking into your eyes as they calm me down like nothing else!',
    'I’m glad you are thoughtful, I’m glad you are understanding, I’m glad you are so much fun to be around, but most of all I’m glad you are my wife. I love you!',
    'You are my answered prayer, My fulfilled wish, My realized dream.',
    'My gratitude for having met you in surpassed only by my amazement at the joy you bring to my life.',
    'Everything you do is a source of joy for me. I can never be sad when I’m around you. Thanks for truly being there, my dear wife. I love you!',
    'All my days with you are days worth living. I’ve forgotten what it feels like to live alone.',
    'Darling wife, it seems that loving you is the only right thing I have ever done in my life. I love you!',
    'With a wife like you, I feel so blessed. You are my life and always on my mind. My beloved, you are one in a million. And I love you very much!',
    'Before I met you, I never knew what it was like to be able to look at someone and smile for no reason. I love you, my wife!',
    'I’ve never been so scared of losing something in my entire life. But nothing in my life has ever meant as much to me as you do. I love you!',
    'I am very glad that you are my wife. I want to fill your life with happiness and love.',
  ];

  Future<void> share(String quotes) async {
    await FlutterShare.share(
      title: 'Lovely Quatos',
      text: quotes,
        chooserTitle: 'Example Chooser Title'
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          ImageContainer(
            image: AssetImage('assets/images/quates.jpg'),
          ),
          ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: quatos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                        border: Border.all(color: Colors.white)),
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quatos[index],
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            IconButton(onPressed: (){
                              setState(() {
                                FlutterClipboard.copy(quatos[index]).then((value){});
                                Fluttertoast.showToast(
                                    msg: "Status Copied",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                     backgroundColor: Colors.black,
                                     textColor: Colors.white,
                                     fontSize: 16.0
                                );
                              });
                            }, icon: Icon(Icons.copy,color: Colors.white,)),
                            IconButton(onPressed: (){
                              share(quatos[index]);
                            }, icon: Icon(Icons.share,color: Colors.white,))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    ));
  }
}
