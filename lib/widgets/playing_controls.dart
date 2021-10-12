import 'package:audio/utils/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayingControls extends StatelessWidget {
  final bool isPlaying;
  final bool isLooping;
  final bool isPlaylist;
  final Function() onPrevious;
  final Function() onPlay;
  final Function() onNext;
  final Function() toggleLoop;
  final Function() onMenuClick;
  final GlobalKey btnKey;

  PlayingControls({
    @required this.isPlaying,
    this.isPlaylist = false,
    @required this.isLooping,
    this.toggleLoop,
    this.onPrevious,
    @required this.onPlay,
    this.onNext,
    this.onMenuClick, this.btnKey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0XFF012C4C),
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(color: MyColors.vintageReport[2], width: 3.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ButtonTheme(
                minWidth: 60.0,
                child: FlatButton(
                  key: this.btnKey,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(100.0),
                  ),
                  child:
                      SvgPicture.asset('assets/icons/menu.svg', height: 30.0),
                  onPressed: this.onMenuClick,
                ),
              ),
              ButtonTheme(
                minWidth: 60.0,
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  child:
                      SvgPicture.asset('assets/icons/next.svg', height: 30.0),
                  onPressed: this.onNext,
                ),
              ),
              ButtonTheme(
                minWidth: 60.0,
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {},
                  child:
                      SvgPicture.asset('assets/icons/play.svg', height: 30.0),
                ),
              ),
              ButtonTheme(
                minWidth: 60.0,
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  child: SvgPicture.asset('assets/icons/previous.svg',
                      height: 30.0),
                  onPressed: this.onPrevious,
                ),
              ),
              ButtonTheme(
                minWidth: 60.0,
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(100.0),
                  ),
                  child: Opacity(
                      opacity: isLooping ? 1.0 : 0.5,
                      child: SvgPicture.asset('assets/icons/loop.svg',
                          height: 30.0)),
                  onPressed: this.toggleLoop,
                ),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/centershape.svg',
              height: 100.0,
            ),
            ButtonTheme(
              minWidth: 60.0,
              child: FlatButton(
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(100.0),
                ),
                child: SvgPicture.asset(
                    isPlaying
                        ? 'assets/icons/pause.svg'
                        : 'assets/icons/play.svg',
                    height: 30.0),
                onPressed: this.onPlay,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
