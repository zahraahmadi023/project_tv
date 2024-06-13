import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:project_tv/cahannel.dart';
import 'package:video_player/video_player.dart';

class PageTv extends StatefulWidget {
  final Channel channel;
  const PageTv({super.key, required this.channel});

  @override
  State<PageTv> createState() => _PageTvState();
}

class _PageTvState extends State<PageTv> {
  ChewieController? chewieController;
  VideoPlayerController? videoPlayerController;

  loadVideo() {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.channel.url))
          ..initialize().then((value) {
            chewieController = ChewieController(
                videoPlayerController: videoPlayerController!,
                autoPlay: true,
                isLive: true);
          });
  }

  @override
  void initState() {
    loadVideo();
    super.initState();
  }

  //برای قطع شدن فیلم بعد از خارج شدن
  @override
  void dispose() {
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF000000),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/img/logo.png',
              height: 55,
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "تلویزیون اینترنتی ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0XFF00B4A7),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 200,
                  child: chewieController == null
                      ? CircularProgressIndicator()
                      : Chewie(controller: chewieController!)),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Image.network(
                        widget.channel.logo,
                        height: 60,
                        // width: 60,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.channel.title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0XFF00B4A7),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'لیست شبکه های تلویزیونی ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.vertical,
                itemCount: Channels.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PageTv(channel: Channels[index]),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0XFFFAD310), Color(0XFF000000)]),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Channels[index].title,
                              style: TextStyle(color: Colors.black),
                            ),
                            Image.network(
                              Channels[index].logo,
                              height: 40,
                              // width: 60,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
