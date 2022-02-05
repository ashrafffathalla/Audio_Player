import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/modules/audio_file.dart';
import 'package:music_player/style/colors.dart' as colors;


class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({Key? key}) : super(key: key);

  @override
  _DetailAudioPageState createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage>
{
   AudioPlayer? advancedPlayer;
  @override
  void initState(){
    super.initState();
    advancedPlayer = AudioPlayer();
  }
  @override

  Widget build(BuildContext context)
  {

    advancedPlayer = AudioPlayer();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children:
        [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: size.height / 3 ,
            child: Container(
              color: colors.audioBlueBackground,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon:const Icon(Icons.arrow_back_ios_new),
                onPressed: () {},
              ),
              actions:
              [
                IconButton(
                  icon:const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: size.height * 0.2,
              height: size.height * 0.36,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(40.0),
                  color: Colors.white,
                ),
                child: Column(
                  children:
                  [
                    SizedBox(height: size.height * 0.1,),
                    const Text(
                       'Tamally Ma\'ak',
                       style: TextStyle(
                         letterSpacing: 1,
                         fontSize: 30.0,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'Avenir',
                       ),
                     ),
                    const Text(
                      'AMR DIAB',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    AudioFile(advancedPlayer:advancedPlayer!),
                  ],
                ),
              )
          ),
          Positioned(
            right: (size.width-135) / 2,
            left: (size.width-135) / 2,
            top: size.height * 0.12,
            height: size.height *0.16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color:Colors.white,width: 2.0 ),
                color: colors.audioGreyBackground,
              ),
              child: Padding(
                padding:const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.circle,
                    border: Border.all(color:Colors.white,width:2 ),
                    image:const DecorationImage(
                      image:AssetImage('assets/images/pic-1.png'),
                      fit: BoxFit.cover,
                    ),
                ),
              ),

            ),
          ),
          ),
        ],
      ),
    );
  }
}
