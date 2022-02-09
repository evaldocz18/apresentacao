import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app.dart';

class Pages extends StatelessWidget {
  const Pages({Key? key}) : super(key: key);

  void _launcherURL(String url) async {
    await launch(url);
  }

  PageViewModel _pageView(title, body, urlImg, urlLauncher) {
    return PageViewModel(
      title: title,
      body: body,
      image: Center(
        child: Image.network(urlImg),
      ),
      footer: ElevatedButton(
        child: const Text("Let's Go!"),
        onPressed: () {
          _launcherURL(urlLauncher);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var listPages = [
      _pageView(
          'You Tube',
          'Increva-se no canal',
          'https://cdn.pixabay.com/photo/2015/03/10/17/23/youtube-667451_960_720.png',
          'https://www.youtube.com/channel/UCAFAtpeZvLiopZUMGhQHrGw'),
      _pageView(
          'GitHub',
          'Acesse os projetos dos cursos',
          'https://cdn.pixabay.com/photo/2017/08/05/11/24/logo-2582757_960_720.png',
          'https://github.com/evaldocz18'),
      _pageView(
          'Linkedin',
          'Me siga no Linkedin!',
          'https://cdn.pixabay.com/photo/2017/10/04/11/58/linkedin-2815969_960_720.jpg',
          'https://www.linkedin.com/in/evaldo-souza-oliveira-53b2aaa8/')
    ];
    return Scaffold(
      body: IntroductionScreen(
        pages: listPages,
        next: const Icon(Icons.navigate_next),
        done: const Text('Fechar'),
        showSkipButton: true,
        skip: const Text('Pular'),
        onDone: () {
          Navigator.of(context).push(MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (context) => App(),
          ));
        },
        onSkip: () {
          Navigator.of(context).push(MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (context) => App(),
          ));
        },
      ),
    );
  }
}
