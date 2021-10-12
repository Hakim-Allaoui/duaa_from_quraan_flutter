import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio/utils/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee_widget/marquee_widget.dart';

class SongsSelector extends StatelessWidget {
  final Playing playing;
  final List<Audio> audios;
  final Function(List<Audio>, int index) onSelected;
  final Function(List<Audio>) onPlaylistSelected;
  final VoidCallback onScroll;

  SongsSelector(
      {@required this.playing,
      @required this.audios,
      @required this.onSelected,
      @required this.onPlaylistSelected,
      @required this.onScroll});

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    _scrollToBottom(double position) {
      _scrollController.animateTo(position, duration: new Duration(seconds: 2), curve: Curves.ease);
    }


    return ListView.builder(
      controller: _scrollController,
      itemCount: this.audios.length,
      itemBuilder: (context, index) {
        final item = this.audios[index];
        final isPlaying = item.path == this.playing?.audio?.assetAudioPath;
        return AnimatedPadding(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.symmetric(
              vertical: isPlaying ? 10.0 : 4.0, horizontal: isPlaying ? 0.0 : 8.0),
          child: Container(
            height: 80.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: isPlaying ? Colors.black54 : Colors.transparent,
                  blurRadius: 10.0,
                  offset: Offset(2.0, 0.0),
                )
              ],
                color: isPlaying
                    ? Color(0XFFEADBCE)
                    : Color(0XFFEADB85),
                borderRadius: BorderRadius.circular(10.0)),
            child: FlatButton(
              onPressed: () {
                _scrollToBottom(index * 88.0);
                this.onSelected(this.audios, index);
              },
              padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: isPlaying
                        ? Marquee(
                            textDirection: TextDirection.rtl,
                            backDuration: Duration(seconds: 2),
                            animationDuration: this.playing.audio.duration +
                                Duration(seconds: 3),
                            child: Text(
                              item.metas.title,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'MeQuran',
                                  color: isPlaying ? MyColors.vintageReport[0] : Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : Text(
                            item.metas.title,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'MeQuran',
                                fontWeight: FontWeight.bold,
                                color: isPlaying ?MyColors.vintageReport[1] : Colors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                  isPlaying
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/playing.svg',
                              height: 20.0),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
