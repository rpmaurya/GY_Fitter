import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerComponent extends StatefulWidget {
  final String? videoLink;
  final String? workoutName;
  final String? exercises;
  final String? time;
  final int? index;

  const VideoPlayerComponent({Key? key, this.videoLink, this.index, this.exercises, this.time, this.workoutName}) : super(key: key);

  @override
  State<VideoPlayerComponent> createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  VideoPlayerController? videoPlayerController;
  Future? videoPlayerFuture;
  int currentDurationInSecond = 0;
  static const allSpeeds = <double>[0.25, 0.5, 1, 1.5, 2, 3, 5, 10];

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoLink.toString());
    videoPlayerFuture = videoPlayerController!.initialize();
    videoPlayerController!.setLooping(false);
    videoPlayerController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FutureBuilder(
          future: videoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: 16.r / 9.r,
                child: VideoPlayer(videoPlayerController!),
              );
            } else {
              return const Center(
                child: null,
              );
            }
          },
        ),
        if (videoPlayerController!.value.isPlaying == false)
          AspectRatio(
            aspectRatio: 16.r / 9.r,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black45,
                    Colors.black87,
                    Colors.black,
                  ],
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Container(
                //color: Colors.red,
                margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.workoutName.toString(),
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiSemiBold,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.exercises.toString(),
                          style: TextStyle(
                            fontFamily: FontFamilyData.sfUiRegularFont,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        widget.time == null
                            ? const SizedBox()
                            : Text(
                                widget.time.toString(),
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiRegularFont,
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        AspectRatio(
          aspectRatio: 16.r / 9.r,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
                child: VideoProgressIndicator(
                  videoPlayerController!,
                  padding: const EdgeInsets.all(0),
                  allowScrubbing: true,
                  colors: const VideoProgressColors(
                    playedColor: Color(0xff35C5F1),
                    bufferedColor: Colors.white54,
                    backgroundColor: Colors.white60,
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(
              () {
                videoPlayerController!.value.isPlaying ? videoPlayerController!.pause() : videoPlayerController!.play();
              },
            );
          },
          child: CircleAvatar(
            backgroundColor: videoPlayerController!.value.isPlaying == false ? Colors.white70 : Colors.transparent,
            radius: 35.r,
            child: Icon(
              videoPlayerController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
              size: 35.sp,
              color: videoPlayerController!.value.isPlaying == false ? Colors.black : Colors.transparent,
            ),
          ),
        ),
      ],
    );
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     Text(getToPosition()),
    //     SizedBox(
    //       height: 11,
    //       width: 250,
    //       child: VideoProgressIndicator(
    //         videoPlayerController!, //controller
    //         allowScrubbing: true,
    //         colors: const VideoProgressColors(
    //           playedColor: Colors.green,
    //           bufferedColor: Colors.white54,
    //           backgroundColor: Colors.black54,
    //         ),
    //       ),
    //     ),
    //     Text(getToDuration()),
    //   ],
    // ),
    // const SizedBox(
    //   height: 50,
    // ),
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     GestureDetector(
    //       onTap: () {
    //         setState(
    //               () {
    //             videoPlayerController!.value.isPlaying
    //                 ? videoPlayerController!.pause()
    //                 : videoPlayerController!.play();
    //           },
    //         );
    //       },
    //       child: CircleAvatar(
    //         radius: 30,
    //         child: Icon(
    //           videoPlayerController!.value.isPlaying
    //               ? Icons.pause
    //               : Icons.play_arrow,
    //         ),
    //       ),
    //     ),
    //     CircleAvatar(
    //       radius: 30,
    //       child: speed(),
    //     ),
    //   ],
    // ),
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }

  getToPosition() {
    final duration = Duration(milliseconds: videoPlayerController!.value.position.inMilliseconds.round());
    return [duration.inMinutes, duration.inSeconds].map((e) => e.remainder(60).toString().padLeft(2, '0')).join(':');
  }

  getToDuration() {
    final duration = Duration(milliseconds: videoPlayerController!.value.duration.inMilliseconds.round());
    return [duration.inMinutes, duration.inSeconds].map((e) => e.remainder(60).toString().padLeft(2, '0')).join(':');
  }

  Widget speed() {
    return Align(
      alignment: Alignment.center,
      child: PopupMenuButton(
        initialValue: videoPlayerController!.value.playbackSpeed,
        onSelected: videoPlayerController!.setPlaybackSpeed,
        itemBuilder: (context) => allSpeeds
            .map<PopupMenuEntry<double>>(
              (e) => PopupMenuItem(
                value: e,
                child: Text('${e}x'),
              ),
            )
            .toList(),
        child: Text('${videoPlayerController!.value.playbackSpeed}x'),
      ),
    );
  }
}
