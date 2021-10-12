import 'package:audio/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PositionSeekWidget extends StatefulWidget {
  final Duration currentPosition;
  final Duration duration;
  final Function(Duration) seekTo;

  const PositionSeekWidget({
    @required this.currentPosition,
    @required this.duration,
    @required this.seekTo,
  });

  @override
  _PositionSeekWidgetState createState() => _PositionSeekWidgetState();
}

class _PositionSeekWidgetState extends State<PositionSeekWidget> {
  Duration _visibleValue;
  bool listenOnlyUserInterraction = false;

  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(PositionSeekWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInterraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 40,
            child: Text(durationToString(widget.duration)),
          ),
          Expanded(
            child: NeumorphicSlider(
              min: 0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: percent * widget.duration.inMilliseconds.toDouble(),
              height: 20.0,
              thumb: Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  color: MyColors.vintageReport[1],
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                    color:MyColors.vintageReport[2],
                    width: 2.0,
                  ),
                ),
              ),
//              SvgPicture.asset('assets/icons/centershape.svg', height: 30.0),
              style: SliderStyle(
                variant: MyColors.vintageReport[2],
                accent: MyColors.vintageReport[2],
                disableDepth: true,
              ),
              onChangeEnd: (newValue) {
                setState(() {
                  listenOnlyUserInterraction = false;
                  widget.seekTo(_visibleValue);
                });
              },
              onChangeStart: (_) {
                setState(() {
                  listenOnlyUserInterraction = true;
                });
              },
              onChanged: (newValue) {
                setState(() {
                  final to = Duration(milliseconds: newValue.floor());
                  _visibleValue = to;
                });
              },
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(durationToString(widget.currentPosition)),
          ),
        ],
      ),
    );
  }
}

String durationToString(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  String twoDigitSeconds =
      twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
