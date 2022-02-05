import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget
{
  final AudioPlayer advancedPlayer;
  const AudioFile({Key? key, required this.advancedPlayer}) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile>
{
  Duration duration = const Duration();
  Duration position = const Duration();
  final String path = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3";
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  List<IconData> icons =
      [
        Icons.play_circle_fill,
        Icons.pause_circle_filled,
      ];
  @override
  void initState()
  {
    super.initState();
    widget.advancedPlayer.onDurationChanged.listen((event)
    {
      setState(()
      {
        duration = event;
      }
      );
    }
    );
    widget.advancedPlayer.onAudioPositionChanged.listen((event)
    {
      setState(()
      {
        position = event;
      });

    });
    widget.advancedPlayer.setUrl(path);
  }
  Widget btnStart()
  {
    return IconButton(
        padding:const EdgeInsets.only(bottom: 10.0),
        onPressed: ()
        {
          if(isPlaying == false)
          {
            this.widget.advancedPlayer.play(path);
            setState(() {
              isPlaying = true;
            });
          }else if(isPlaying == true){
            this.widget.advancedPlayer.pause();
            setState(() {
              isPlaying = false;
            });
          }
        },
        icon:isPlaying == false ? Icon(icons[0],size: 50,color: Colors.blue,) : Icon(icons[1],size: 50,color: Colors.blue),
    );
  }
  Widget loadAsset()
  {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnRepeat(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnLoop()

        ],
      ),
    );
  }
  Widget slider()
  {
    return Slider(
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        min: 0.0,
        max: duration.inSeconds.toDouble(),
        onChanged: (double value)
        {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        }
    );
  }
  Widget btnFast()
  {
    return IconButton(
        onPressed: ()
        {
          widget.advancedPlayer.setPlaybackRate(1.5);
        },
        icon:const ImageIcon(
          AssetImage('assets/images/forward.png'),
          size: 16,
        ),
    );
  }
  Widget btnSlow()
  {
    return IconButton(
      onPressed: ()
      {
        widget.advancedPlayer.setPlaybackRate(0.5);
      },
      icon:const ImageIcon(
          AssetImage('assets/images/backword.png'),
        size: 16,
      ),
    );
  }
  Widget btnLoop()
  {
    return IconButton(
        onPressed: (){},
        icon:const ImageIcon(AssetImage('assets/images/loop.png'), size: 16,),
    );
  }
  Widget btnRepeat()
  {
    return IconButton(
        onPressed: ()
        {
          if(isRepeat == false)
            {
              widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
              setState(() {
                isRepeat =true;
                Colors.blue;
              });
            }else if (isRepeat == true){
            widget.advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
            Colors.black;
          }
        },
        icon:const ImageIcon(AssetImage('assets/images/repeat.png'),
        size: 16,
        ),
    );
  }
  //Start changeToSecond
  void changeToSecond (int second)
  {
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlayer.seek(newDuration);
  }
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:
        [
          Padding(padding: const EdgeInsets.only(left: 20, right: 20,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                Text(position.toString().split(".")[0], style:const TextStyle(fontSize: 16),),
                Text(duration.toString().split(".")[0], style:const TextStyle(fontSize: 16),),
              ],
            ),
          ),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}
