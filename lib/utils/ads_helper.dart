import 'dart:math';

//import 'package:admob_flutter/admob_flutter.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'my_theme.dart';

class AdsHelper {
  //static String appId = 'ca-app-pub-8644958469423958~5019245701';
//  static String appId = 'ca-app-pub-3940256099942544~1458002511'; //test

  static String testingId = 'a06a69ab-6379-4d12-978d-490079105f9a';

  //FB Banner
  static String fbBannerId_1 = '680895249340081_680902216006051';
  static String fbBannerId_2 = '680895249340081_680910462671893';

  //FB Inter
  static String fbInterId_1 = '680895249340081_680910746005198';
  static String fbInterId_2 = '680895249340081_680910926005180';

  //FB Native Banner
  static String fbNativeBannerId = '';

  //FB Native
  static String fbNativeId = '';

  //static String admobBannerId_1 = 'ca-app-pub-8644958469423958/2859986226';
//  static String admobBannerId_1 = 'ca-app-pub-3940256099942544/6300978111'; //test
//  static String admobBannerId_2 = '';

  //static String admobInterId_1 = 'ca-app-pub-8644958469423958/6998827197';
//  static String admobInterId_1 = 'ca-app-pub-3940256099942544/1033173712'; //test
//  static String admobInterId_2 = '';

  static int adsFrequency = 50;
  bool _isInterstitialAdLoaded = false;

  Widget fbBannerAd;
  Widget fbNativeBannerAd;
  Widget fbNativeAd;
  FacebookInterstitialAd fbInter;

//  Widget admobBanner;
  //AdmobInterstitial admobInter;

  static void initFacebookAds() {
    FacebookAudienceNetwork.init(
      testingId: AdsHelper.testingId,
    );
  }

/*  static void initAdmobAds() {
    Admob.initialize(AdsHelper.appId);
  }*/

  loadFbInter(String fbInterId) {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: fbInterId,
      listener: (result, value) {
        print(
            "================(Fb Inter)===============> result : $result *********** =====> value : $value");
        if (result == InterstitialAdResult.LOADED) {
          _isInterstitialAdLoaded = true;
        }
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          loadFbInter(fbInterId);
        }
      },
    );
  }

  showFbInter() {
    if (_isInterstitialAdLoaded == true) {
      FacebookInterstitialAd.showInterstitialAd();
      print('===========(Fb Inter Showen)===========> :D');
    } else
      print(
          "================(in show fb Inter)=========> Interstial Ad not yet loaded!");
  }

  /*loadAdmobInter(String admobInterId) {
    if (admobInter == null) {
      admobInter = AdmobInterstitial(
        adUnitId: admobInterId,
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) admobInter.load();
          print('================(Admob Inter)========> $event');
        },
      );
    }
    admobInter.load();
  }*/

/*  showAdmobInter() async {
    if (await admobInter.isLoaded) {
      var b = new Random().nextBool();
      if (b) {
        admobInter.show();
      } else {
        print('===========(Admob Inter : No Chance)===========> Better chance next time ;)');
      }
    } else {
      print(
          '================(in show admob Inter)=========> Interstitial ad is not loaded yet!');
    }
  }*/

  showInter({int probablity = 50}) async {
    Random r = new Random();
    double falseProbability = (100 - probablity) / 100;
    bool result = r.nextDouble() > falseProbability;
    if(result) {
      //var n = new Random().nextInt();
      //if (n % 2 == 0) {
      //showAdmobInter();
      //} else {
      showFbInter();
      //}
    }
    print('====================> Probablity of $probablity% return $result');
  }

  Widget getFbBanner(String bannerId, BannerSize size) {
    if (fbBannerAd == null) {
      fbBannerAd = Container(
        //margin: EdgeInsets.only(bottom: 5.0),
        alignment: Alignment(0.5, 1),
        child: FacebookBannerAd(
          placementId: bannerId,
          bannerSize: size,
          listener: (result, value) {
            print("================(Fb Banner)==============> $value");
          },
        ),
      );
    }
    return fbBannerAd;
  }

  Widget getFbNativeBanner(String nativeBannerId, NativeBannerAdSize size) {
    if (fbNativeBannerAd == null) {
      fbNativeBannerAd = Container(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: FacebookNativeAd(
          placementId: nativeBannerId,
          adType: NativeAdType.NATIVE_BANNER_AD,
          bannerAdSize: size,
          width: double.infinity,
          backgroundColor: MyColors.vintageReport[2],
          titleColor: MyColors.darklight["dark"],
          descriptionColor: MyColors.darklight["dark"],
          buttonColor: MyColors.vintageReport[0],
          buttonTitleColor: Colors.white,
          buttonBorderColor: Colors.white,
          listener: (result, value) {
            print("================(Fb NativeBanner)==============> $value");
          },
        ),
      );
    }
    return fbNativeBannerAd;
  }

  Widget getFbNative(String fbNativeId, double size) {
    if (fbNativeAd == null) {
      fbNativeAd = Container(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: FacebookNativeAd(
          placementId: fbNativeId,
          adType: NativeAdType.NATIVE_AD,
          width: double.infinity,
          height: size,
          backgroundColor: MyColors.vintageReport[2],
          titleColor: MyColors.darklight["dark"],
          descriptionColor: MyColors.darklight["dark"],
          buttonColor: MyColors.vintageReport[0],
          buttonTitleColor: Colors.white,
          buttonBorderColor: Colors.white,
          listener: (result, value) {
            print("================(Fb Native)==============> : --> $value");
          },
        ),
      );
    }
    return fbNativeAd;
  }

/*  Widget getAdmobBanner(String bannerId, AdmobBannerSize size) {
    if (admobBanner == null) {
      admobBanner = Container(
        child: AdmobBanner(
          adUnitId: bannerId,
          adSize: size,
          listener: (AdmobAdEvent event, Map<String, dynamic> args) {
            print("================(Admob Banner)==============> $event");
          },
        ),
      );
    }
    return admobBanner;
  }*/

  disposeAllAds() {
    //admobInter.dispose();
    FacebookInterstitialAd.destroyInterstitialAd();
  }
}
