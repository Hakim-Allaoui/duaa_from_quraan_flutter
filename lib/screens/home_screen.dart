import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio/utils/ads_helper.dart';
import 'package:audio/utils/audio_helper.dart';
import 'package:audio/utils/background.dart';
import 'package:audio/utils/my_navigator.dart';
import 'package:audio/utils/my_theme.dart';
import 'package:audio/utils/strings.dart';
import 'package:audio/utils/tools.dart';
import 'package:audio/widgets/playing_controls.dart';
import 'package:audio/widgets/position_seek_widget.dart';
import 'package:audio/widgets/songs_selector.dart';
import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:popup_menu/popup_menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AdsHelper ads;

  /* final audios = <Audio>[
    Audio(
      "assets/audios/ibrahem-41.mp3",
      metas: Metas(
        title: "ربنا اغفر لي و لوالدي",
        artist: "Developer : Hakim Allaoui",
        album: Tools.packageInfo.appName,
        image: MetasImage.asset('assets/icon.png'),
      ),
    ),
    Audio(
      "assets/audios/ibrahem-40.mp3",
      metas: Metas(
        title: "ربي اجعلني مقيم الصلاة",
        artist: "Developer : Hakim Allaoui",
        album: Tools.packageInfo.appName,
        image: MetasImage.asset('assets/icon.png'),
      ),
    ),
    Audio(
      "assets/audios/al-shuara-83-87.mp3",
      metas: Metas(
        title: "ربي هب لي حكما و ألحقني بالصالحين",
        artist: "Developer : Hakim Allaoui",
        album: Tools.packageInfo.appName,
        image: MetasImage.asset('assets/icon.png'),
      ),
    ),
    Audio(
      "assets/audios/al-saffat-100.mp3",
      metas: Metas(
        title: "ربي هب لي من الصالحين",
        artist: "Developer : Hakim Allaoui",
        album: Tools.packageInfo.appName,
        image: MetasImage.asset('assets/icon.png'),
      ),
    ),
  ];*/

  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  final List<StreamSubscription> _subscriptions = [];
  PopupMenu menu;
  GlobalKey btnKey = GlobalKey();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    _subscriptions.add(_assetsAudioPlayer.playlistFinished.listen((data) {
      print("finished : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print("playlistAudioFinished : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.current.listen((data) {
      print("current : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.onReadyToPlay.listen((audio) {
      print("onRedayToPlay : $audio");
    }));
    super.initState();

    _assetsAudioPlayer.open(
      Playlist(audios: AudioHelper.audios),
      showNotification: true,
      autoStart: false,
    );

    ads = new AdsHelper();
    ads.loadFbInter(AdsHelper.fbInterId_1);
    menu = new PopupMenu();
  }

  void stateChanged(bool isShow) {
    print('menu is ${isShow ? 'showing' : 'closed'}');
  }

  void onClickMenu(MenuItemProvider item) {
    switch (item.menuTitle) {
      case 'نسخ':
//        print('==============> copy selected');
        Clipboard.setData(
          ClipboardData(
              text:
                  '${AudioHelper.titles[_assetsAudioPlayer.playlist.startIndex].split(']')[0]}]'),
        );
        // _drawerKey.currentState
        //     .showSnackBar(new SnackBar(content: Text('تم النسخ')));

        break;
      case 'مشاركة':
        share(
            '${AudioHelper.titles[_assetsAudioPlayer.playlist.startIndex].split(']')[0]}]');
        print('==============> Home selected');
        break;
      default:
        onDismiss();
        break;
    }

//    print('Click menu -> ${item.menuTitle}');
  }

  void onDismiss() {
    print('Menu is dismiss');
  }

  Future<void> share(String douaa) async {
    await FlutterShare.share(
      title: Tools.packageInfo.appName,
      text: douaa,
      linkUrl: 'https://play.google.com/store/apps/details?id=' +
          Tools.packageInfo.packageName,
      chooserTitle: 'مشاركة الدعاء',
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    ads.disposeAllAds();
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      /*SystemUiOverlay.top, SystemUiOverlay.bottom*/
    ]);

    PopupMenu.context = context;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: <Widget>[
          MainBackground(),
          Scaffold(
            key: _drawerKey,
            endDrawer: buildDrawer(),
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Positioned(
                              right: 80.0,
                              child: Container(
                                padding: EdgeInsets.only(right: 20.0, top: 8.0, bottom: 8.0),
                                decoration: BoxDecoration(
                                  color: MyColors.vintageReport[0].withOpacity(0.8),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100.0),
                                    bottomLeft: Radius.circular(100.0),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                                    child: Text(
                                      Tools.packageInfo.appName,
                                      style: Theme.of(context).textTheme.titleLarge?.apply(fontSizeFactor: 0.8),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/icon.png',
                              height: 100.0,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ads.showInter(probablity: 20);
                          _drawerKey.currentState.openEndDrawer();
                        },
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.vintageReport[0]
                                .withOpacity(0.8),
                          ),
                          child: SvgPicture.asset("assets/icons/menu.svg", height: 30.0,),
                        ),
                      ),
                    ],
                  ),
                ),
                // ads.getFbBanner(AdsHelper.fbBannerId_1, BannerSize.STANDARD),
                Expanded(
                  child: PlayerBuilder.current(
                      player: _assetsAudioPlayer,
                      builder: (BuildContext context, Playing playing) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SongsSelector(
                            audios: AudioHelper.audios,
                            onPlaylistSelected: (myAudios) {
                              _assetsAudioPlayer.open(
                                Playlist(audios: myAudios),
                                showNotification: true,
                                autoStart: false,
                              );
                            },
                            onSelected: (myAudios, index) {
                              ads.showInter(probablity: 40);
                              _assetsAudioPlayer.open(
                                Playlist(audios: myAudios, startIndex: index),
                                showNotification: true,
                                autoStart: true,
                              );
                            },
                            playing: playing,
                            onScroll: () {},
                          ),
                        );
                      }),
                ),
                PlayerBuilder.current(
                  player: _assetsAudioPlayer,
                  builder: (context, playing) {
                    /*if (playing == null) {
                      return Container(
                        child: Text('تم إيقاف المشغل...'),
                      );
                    }*/
                    return Column(
                      children: <Widget>[
                        PlayerBuilder.loopMode(
                          player: _assetsAudioPlayer,
                          builder: (context, isLooping) {
                            return PlayerBuilder.isPlaying(
                              player: _assetsAudioPlayer,
                              builder: (context, isPlaying) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: PlayingControls(
                                    btnKey: btnKey,
                                    onMenuClick: showPopupMenu,
                                    isLooping: isLooping == LoopMode.playlist,
                                    isPlaying: isPlaying,
                                    isPlaylist: true,
                                    toggleLoop: () {
                                      _assetsAudioPlayer.toggleLoop();
                                      ads.showInter(probablity: 10);
                                    },
                                    onPlay: () {
                                      _assetsAudioPlayer.playOrPause();
                                      ads.showInter(probablity: 10);
                                    },
                                    onNext: () {
                                      //_assetsAudioPlayer.forward(Duration(seconds: 10));
                                      _assetsAudioPlayer.next();
                                      ads.showInter(probablity: 10);
                                    },
                                    onPrevious: () {
                                      _assetsAudioPlayer.previous();
                                      ads.showInter(probablity: 10);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        playing == null
                            ? SizedBox()
                            : PlayerBuilder.realtimePlayingInfos(
                                player: _assetsAudioPlayer,
                                builder: (context, infos) {
                                  if (infos == null) {
                                    return SizedBox();
                                  }
                                  //print("infos: $infos");
                                  return PositionSeekWidget(
                                    currentPosition: infos.currentPosition,
                                    duration: infos.duration,
                                    seekTo: (to) {
                                      _assetsAudioPlayer.seek(to);
                                    },
                                  );
                                },
                              ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 80.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showDialog() {
    showGeneralDialog(
      barrierLabel: Strings.about,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(Strings.about,
                        style: Theme.of(context).textTheme.titleLarge.apply(
                            fontSizeFactor: 2,
                            color: MyColors.darklight["light"])),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/icon.png',
                            height: 50.0,
                          ),
                        ),
                        Text(
                            Tools.packageInfo.appName +
                                ' ' +
                                Tools.packageInfo.version,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                .apply(color: MyColors.darklight["light"])),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        Strings.aboutText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.0)),
                              color: MyColors.vintageReport[0].withOpacity(0.3),
                            ),
                            child: TextButton(
                              // padding: EdgeInsets.all(18.0),
                                child: new Text(
                                  'رجوع',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5.0)),
                              color: MyColors.vintageReport[0].withOpacity(0.3),
                            ),
                            child: TextButton(
                              // padding: EdgeInsets.all(18.0),
                                child: new Text(
                                  Strings.rate,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                onPressed: () {
//                                  Navigator.pop(context);
                                  Tools.launchURLRate();
                                }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                decoration: BoxDecoration(
                  color: MyColors.vintageReport[1],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.asset(
                              'assets/icon.png',
                              width: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Tools.packageInfo == null
                            ? SizedBox()
                            : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  Tools.packageInfo.appName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      .apply(
                                          color: MyColors.darklight["light"],
                                          fontSizeFactor: 1.5),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                          child: TextButton(
                            // padding: EdgeInsets.all(10.0),
                            // color:
                            //     Theme.of(context).accentColor.withOpacity(0.1),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: new BorderRadius.circular(100.0),
                            // ),
                            onPressed: () {
                              Navigator.pop(context);
                              ads.showInter(probablity: 10);
                            },
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 10.0,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/home.svg',
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text(
                                  Strings.home,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      .apply(
                                          color: MyColors.darklight["light"]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 8.0, right: 8.0),
                          child: TextButton(
                            // padding: EdgeInsets.all(10.0),
                            // color:
                            //     Theme.of(context).accentColor.withOpacity(0.1),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: new BorderRadius.circular(100.0),
                            // ),
                            onPressed: () {
                              Tools.launchURLRate();
                            },
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 10.0,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/rate.svg',
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text(
                                  Strings.rate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      .apply(
                                          color: MyColors.darklight["light"]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 8.0, right: 8.0),
                          child: TextButton(
                            // padding: EdgeInsets.all(10.0),
                            // color:
                            //     Theme.of(context).accentColor.withOpacity(0.1),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: new BorderRadius.circular(100.0),
                            // ),
                            onPressed: () {
                              Tools.launchURLMore();
                            },
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 10.0,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/more.svg',
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text(
                                  Strings.more,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      .apply(
                                          color: MyColors.darklight["light"]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 8.0, right: 8.0),
                          child: TextButton(
                            // padding: EdgeInsets.all(10.0),
                            // color:
                            //     Theme.of(context).accentColor.withOpacity(0.1),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: new BorderRadius.circular(100.0),
                            // ),
                            onPressed: () {
                              Navigator.pop(context);
                              ads.showInter(probablity: 30);
                              MyNavigator.goPrivacy(context);
                            },
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 10.0,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/privacy_policy.svg',
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text(
                                  Strings.privacy,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      .apply(
                                          color: MyColors.darklight["light"]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 8.0, right: 8.0),
                          child: TextButton(
                            // padding: EdgeInsets.all(10.0),
                            // color:
                            //     Theme.of(context).accentColor.withOpacity(0.1),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: new BorderRadius.circular(100.0),
                            // ),
                            onPressed: () {
                              Navigator.pop(context);
                              ads.showInter(probablity: 30);
                              showDialog();
                            },
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 10.0,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/about.svg',
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text(
                                  Strings.about,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      .apply(
                                          color: MyColors.darklight["light"]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'الإصدار ' + Tools.packageInfo.version,
                      style: TextStyle(
                          color: MyColors.darklight["light"], fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -100.0,
            right: -100.0,
            child: Image.asset(
              'assets/images/decore.png',
              height: 200.0,
            ),
          ),
          Positioned(
            bottom: -100.0,
            right: -100.0,
            child: Image.asset(
              'assets/images/decore.png',
              height: 200.0,
            ),
          ),
          Positioned(
            top: -100.0,
            left: -100.0,
            child: Image.asset(
              'assets/images/decore.png',
              height: 200.0,
            ),
          ),
          Positioned(
            bottom: -100.0,
            left: -100.0,
            child: Image.asset(
              'assets/images/decore.png',
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }

  void showPopupMenu() {
    PopupMenu menu = PopupMenu(
        backgroundColor: MyColors.vintageReport[1].withOpacity(0.9),
        lineColor: MyColors.vintageReport[0],
        maxColumn: 2,
        items: [
          MenuItem(
            title: 'نسخ',
            image: Icon(
              Icons.content_copy,
              color: MyColors.vintageReport[2],
            ),
          ),
          MenuItem(
            title: 'مشاركة',
            // textStyle: TextStyle(fontSize: 10.0, color: Colors.tealAccent),
            image: Icon(
              Icons.share,
              color: MyColors.vintageReport[2],
            ),
          ),
        ],
        onClickMenu: onClickMenu,
        stateChanged: stateChanged,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey);
  }
}
