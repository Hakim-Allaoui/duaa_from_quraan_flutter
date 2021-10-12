import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio/utils/tools.dart';

class AudioHelper {
  static List<Audio> audios = <Audio>[];

/*  static List<Audio> audios = <Audio>[*/ /*
    */ /**/ /*Audio.network(
        "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3",
        metas: Metas(
          title: "Online",
          artist: "Florent Champigny",
          album: "OnlineAlbum",
          image: MetasImage.network("https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg"),
        ),
      ),*/ /**/ /*
    Audio(
      "assets/audios/al-aaraf-23.mp3",
      metas: Metas(
        title: "ربنا ظلمنا أنفسنا",
        artist: "Developer : Hakim Allaoui",
        album: Tools.packageInfo.appName,
        image: MetasImage.asset('assets/icon.png'),
      ),
    ),
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
  */ /*];*/

  static List<String> titles = [
    """
  بسم الله الرحمن الرحيم {رَبَّنَا تَقَبَّلْ مِنَّا ۖ إِنَّكَ أَنْتَ السَّمِيعُ الْعَلِيمُ ﴿١٢٧﴾ رَبَّنَا وَاجْعَلْنَا مُسْلِمَيْنِ لَكَ وَمِنْ ذُرِّيَّتِنَا أُمَّةً مُسْلِمَةً لَكَ وَأَرِنَا مَنَاسِكَنَا وَتُبْ عَلَيْنَا ۖ إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيمُ} [البقرة:١٢٧-١٢٨] , صوت القارئ: أحمد رجب.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ} , [البقرة:٢٠١] , صوت القارئ: أحمد العجمي.
  """,
    """بسم الله الرحمن الرحيم {رِبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَثَبِّتْ أَقْدَامَنَا وَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ} [البقرة:٢٥٠].
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَسِينَا أَوْ أَخْطَأْنَا ۚ رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا ۚ رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ ۖ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا ۚ أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ} , [البقرة:٢٨٦] , صوت القارئ: إدريس أبكر.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِنْ لَدُنْكَ رَحْمَةً ۚ إِنَّكَ أَنْتَ الْوَهَّابُ ﴿٨﴾ رَبَّنَا إِنَّكَ جَامِعُ النَّاسِ لِيَوْمٍ لَا رَيْبَ فِيهِ ۚ إِنَّ اللَّهَ لَا يُخْلِفُ الْمِيعَادَ} , [آل عمران:٨-٩] , صوت القارئ: سعود الشريم .
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا إِنَّنَا آمَنَّا فَاغْفِرْ لَنَا ذُنُوبَنَا وَقِنَا عَذَابَ النَّارِ} , [آل عمران:١٦] , صوت القارئ: العشري عمران.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ هَبْ لِي مِنْ لَدُنْكَ ذُرِّيَّةً طَيِّبَةً ۖ إِنَّكَ سَمِيعُ الدُّعَاءِ} , [آل عمران:٣٨] , صوت القارئ: العشري عمران.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا آمَنَّا بِمَا أَنْزَلْتَ وَاتَّبَعْنَا الرَّسُولَ فَاكْتُبْنَا مَعَ الشَّاهِدِينَ} , [آل عمران:٥٣] , صوت القارئ: صالح الصاهود.
  """,
    """بسم الله الرحمن الرحيم {وَمَا كَانَ قَوْلَهُمْ إِلَّا أَنْ قَالُوا رَبَّنَا اغْفِرْ لَنَا ذُنُوبَنَا وَإِسْرَافَنَا فِي أَمْرِنَا وَثَبِّتْ أَقْدَامَنَا وَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ} , [آل عمران:١٤٧] , صوت القارئ: عبدالباسط عبدالصمد.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا مَا خَلَقْتَ هَٰذَا بَاطِلًا سُبْحَانَكَ فَقِنَا عَذَابَ النَّارِ ﴿١٩١﴾ رَبَّنَا إِنَّكَ مَنْ تُدْخِلِ النَّارَ فَقَدْ أَخْزَيْتَهُ ۖ وَمَا لِلظَّالِمِينَ مِنْ أَنْصَارٍ ﴿١٩٢﴾ رَبَّنَا إِنَّنَا سَمِعْنَا مُنَادِيًا يُنَادِي لِلْإِيمَانِ أَنْ آمِنُوا بِرَبِّكُمْ فَآمَنَّا ۚ رَبَّنَا فَاغْفِرْ لَنَا ذُنُوبَنَا وَكَفِّرْ عَنَّا سَيِّئَاتِنَا وَتَوَفَّنَا مَعَ الْأَبْرَارِ ﴿١٩٣﴾ رَبَّنَا وَآتِنَا مَا وَعَدْتَنَا عَلَىٰ رُسُلِكَ وَلَا تُخْزِنَا يَوْمَ الْقِيَامَةِ ۗ إِنَّكَ لَا تُخْلِفُ الْمِيعَادَ} , [آل عمران:١٩١-١٩٤] , صوت القارئ: خليفة الطنيجي.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا أَخْرِجْنَا مِنْ هَٰذِهِ الْقَرْيَةِ الظَّالِمِ أَهْلُهَا وَاجْعَلْ لَنَا مِنْ لَدُنْكَ وَلِيًّا وَاجْعَلْ لَنَا مِنْ لَدُنْكَ نَصِيرًا} , [النساء:٧٥] , صوت القارئ: ياسر سلامة.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا ظَلَمْنَا أَنْفُسَنَا وَإِنْ لَمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ} , [الأعراف:٢٣] , صوت القارئ: عادل ريان.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا افْتَحْ بَيْنَنَا وَبَيْنَ قَوْمِنَا بِالْحَقِّ وَأَنْتَ خَيْرُ الْفَاتِحِينَ} [الأعراف:٨٩] , صوت القارئ: شيخ أبو بكر الشاطري.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَتَوَفَّنَا مُسْلِمِينَ} [الأعراف:١٢٦] , صوت القارئ: محمود علي البنا .
  """,
    """بسم الله الرحمن الرحيم {أَنْتَ وَلِيُّنَا فَاغْفِرْ لَنَا وَارْحَمْنَا ۖ وَأَنْتَ خَيْرُ الْغَافِرِينَ} , [الأعراف:١٥٥] , صوت القارئ: عادل الكلباني.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا لَا تَجْعَلْنَا فِتْنَةً لِلْقَوْمِ الظَّالِمِينَ ﴿٨٥﴾ وَنَجِّنَا بِرَحْمَتِكَ مِنَ الْقَوْمِ الْكَافِرِينَ} , [يونس:٨٥-٨٦] , صوت القارئ: شيرزاد عبد الرحمن طاهر .
  """,
    """بسم الله الرحمن الرحيم {رَبِّ إِنِّي أَعُوذُ بِكَ أَنْ أَسْأَلَكَ مَا لَيْسَ لِي بِهِ عِلْمٌ ۖ وَإِلَّا تَغْفِرْ لِي وَتَرْحَمْنِي أَكُنْ مِنَ الْخَاسِرِينَ} , [هود:٤٧] , صوت القارئ: توفيق الصائغ.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِنْ ذُرِّيَّتِي ۚ رَبَّنَا وَتَقَبَّلْ دُعَاءِ ﴿٤٠﴾ رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ} , [إبراهيم:٤٠-٤١] , صوت القارئ: حاتم فريد.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ أَدْخِلْنِي مُدْخَلَ صِدْقٍ وَأَخْرِجْنِي مُخْرَجَ صِدْقٍ وَاجْعَلْ لِي مِنْ لَدُنْكَ سُلْطَانًا نَصِيرًا} , [الإسراء:٨٠] , صوت القارئ: صلاح البدير.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا آتِنَا مِنْ لَدُنْكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا} , [الكهف:١٠] , صوت القارئ: سعد الغامدي.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ اشْرَحْ لِي صَدْرِي ﴿٢٥﴾ وَيَسِّرْ لِي أَمْرِي ﴿٢٦﴾ وَاحْلُلْ عُقْدَةً مِنْ لِسَانِي ﴿٢٧﴾ يَفْقَهُوا قَوْلِي} , [طه:٢٥-٢٨] , صوت القارئ: حاتم فريد.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ زِدْنِي عِلْمًا} , [طه:١١٤] , صوت القارئ: محمد صديق المنشاوي.
  """,
    """بسم الله الرحمن الرحيم {فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ} , [الأنبياء:٨٧] , صوت القارئ: صالح الصاهود .
  """,
    """بسم الله الرحمن الرحيم {رَبِّ لَا تَذَرْنِي فَرْدًا وَأَنْتَ خَيْرُ الْوَارِثِينَ} , [الأنبياء:٨٩] , صوت القارئ: توفيق الصائغ.
  """,
    """بسم الله الرحمن الرحيم { وَقُلْ رَبِّ أَعُوذُ بِكَ مِنْ هَمَزَاتِ الشَّيَاطِينِ ﴿٩٧﴾ وَأَعُوذُ بِكَ رَبِّ أَنْ يَحْضُرُونِ} , [المؤمنون:٩٧-٩٨] , صوت القارئ: إدريس أبكر.
  """,
    """بسم الله الرحمن الرحيم {ربَّنَا آمَنَّا فَاغْفِرْ لَنَا وَارْحَمْنَا وَأَنْتَ خَيْرُ الرَّاحِمِينَ} , [المؤمنون:١٠٩] , صوت القارئ: شيرزاد عبد الرحمن طاهر.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ اغْفِرْ وَارْحَمْ وَأَنْتَ خَيْرُ الرَّاحِمِينَ} , [المؤمنون:١١٨] , صوت القارئ: عبدالباسط عبدالصمد.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا اصْرِفْ عَنَّا عَذَابَ جَهَنَّمَ ۖ إِنَّ عَذَابَهَا كَانَ غَرَامًا ﴿٦٥﴾ إِنَّهَا سَاءَتْ مُسْتَقَرًّا وَمُقَامًا} , [الفرقان:٦٥-٦٦] , صوت القارئ: عادل ريان.
  """,
    """بسم الله الرحمن الرحيم {وَالَّذِينَ يَقُولُونَ رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ وَاجْعَلْنَا لِلْمُتَّقِينَ إِمَامًا} , [الفرقان:٧٤] , صوت القارئ: ياسر سلامة.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ هَبْ لِي حُكْمًا وَأَلْحِقْنِي بِالصَّالِحِينَ﴿٨٣﴾وَاجْعَلْ لِي لِسَانَ صِدْقٍ فِي الْآخِرِينَ ﴿٨٤﴾ وَاجْعَلْنِي مِنْ وَرَثَةِ جَنَّةِ النَّعِيمِ ﴿٨٥﴾ وَاغْفِرْ لِأَبِي إِنَّهُ كَانَ مِنَ الضَّالِّينَ ﴿٨٦﴾ وَلَا تُخْزِنِي يَوْمَ يُبْعَثُونَ ﴿٨٧﴾ يَوْمَ لَا يَنْفَعُ مَالٌ وَلَا بَنُونَ ﴿٨٨﴾ إِلَّا مَنْ أَتَى اللَّهَ بِقَلْبٍ سَلِيمٍ} , [الشعراء:٨٣-٨٩] , صوت القارئ: صلاح بوخاطر.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ نَجِّنِي وَأَهْلِي مِمَّا يَعْمَلُونَ} , [الشعراء:١٦٩] , صوت القارئ: أحمد رجب.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ الَّتِي أَنْعَمْتَ عَلَيَّ وَعَلَىٰ وَالِدَيَّ وَأَنْ أَعْمَلَ صَالِحًا تَرْضَاهُ وَأَدْخِلْنِي بِرَحْمَتِكَ فِي عِبَادِكَ الصَّالِحِينَ} , [النمل:١٩] , صوت القارئ: صلاح الهاشم.
  """,
    """بسم الله الرحمن الرحيم {قَالَ رَبِّ إِنِّي ظَلَمْتُ نَفْسِي فَاغْفِرْ لِي} , [القصص:١٦] , صوت القارئ: محمود خليل الحصري.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ انْصُرْنِي عَلَى الْقَوْمِ الْمُفْسِدِينَ} , [العنكبوت:٣٠] , صوت القارئ: صلاح بوخاطر.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا وَسِعْتَ كُلَّ شَيْءٍ رَحْمَةً وَعِلْمًا فَاغْفِرْ لِلَّذِينَ تَابُوا وَاتَّبَعُوا سَبِيلَكَ وَقِهِمْ عَذَابَ الْجَحِيمِ ﴿٧﴾رَبَّنَا وَأَدْخِلْهُمْ جَنَّاتِ عَدْنٍ الَّتِي وَعَدْتَهُمْ وَمَنْ صَلَحَ مِنْ آبَائِهِمْ وَأَزْوَاجِهِمْ وَذُرِّيَّاتِهِمْ ۚ إِنَّكَ أَنْتَ الْعَزِيزُ الْحَكِيمُ ﴿٨﴾ وَقِهِمُ السَّيِّئَاتِ ۚ وَمَنْ تَقِ السَّيِّئَاتِ يَوْمَئِذٍ فَقَدْ رَحِمْتَهُ ۚ وَذَٰلِكَ هُوَ الْفَوْزُ الْعَظِيمُ} , [غافر:٧-٩] , صوت القارئ: شيخ أبو بكر الشاطري.
  """,
    """بسم الله الرحمن الرحيم { رَبَّنَا اكْشِفْ عَنَّا الْعَذَابَ إِنَّا مُؤْمِنُونَ} , [الدخان:١٢] , صوت القارئ: أحمد العجمي.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ الَّتِي أَنْعَمْتَ عَلَيَّ وَعَلَىٰ وَالِدَيَّ وَأَنْ أَعْمَلَ صَالِحًا تَرْضَاهُ وَأَصْلِحْ لِي فِي ذُرِّيَّتِي ۖ إِنِّي تُبْتُ إِلَيْكَ وَإِنِّي مِنَ الْمُسْلِمِينَ} , [الأحقاف:١٥] , صوت القارئ: سعد الغامدي.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا اغْفِرْ لَنَا وَلِإِخْوَانِنَا الَّذِينَ سَبَقُونَا بِالْإِيمَانِ وَلَا تَجْعَلْ فِي قُلُوبِنَا غِلًّا لِلَّذِينَ آمَنُوا رَبَّنَا إِنَّكَ رَءُوفٌ رَحِيمٌ} , [الحشر:١٠] , صوت القارئ: محمود الطبيب.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا عَلَيْكَ تَوَكَّلْنَا وَإِلَيْكَ أَنَبْنَا وَإِلَيْكَ الْمَصِيرُ ﴿٤﴾ رَبَّنَا لَا تَجْعَلْنَا فِتْنَةً لِلَّذِينَ كَفَرُوا وَاغْفِرْ لَنَا رَبَّنَا ۖ إِنَّكَ أَنْتَ الْعَزِيزُ الْحَكِيمُ} , [الممتحنة:٤-٥] , صوت القارئ: عادل ريان.
  """,
    """بسم الله الرحمن الرحيم {رَبَّنَا أَتْمِمْ لَنَا نُورَنَا وَاغْفِرْ لَنَا ۖ إِنَّكَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ} , [التحريم:٨] , صوت القارئ: عبدالرحمن السديس.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ لَا تَذَرْ عَلَى الْأَرْضِ مِنَ الْكَافِرِينَ دَيَّارًا ﴿٢٦﴾ إِنَّكَ إِنْ تَذَرْهُمْ يُضِلُّوا عِبَادَكَ وَلَا يَلِدُوا إِلَّا فَاجِرًا كَفَّارًا ﴿٢٧﴾ رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِمَنْ دَخَلَ بَيْتِيَ مُؤْمِنًا وَلِلْمُؤْمِنِينَ وَالْمُؤْمِنَاتِ وَلَا تَزِدِ الظَّالِمِينَ إِلَّا تَبَارًا} , [نوح:٢٦-٢٨] , صوت القارئ: صلاح الهاشم.
  """,
    """بسم الله الرحمن الرحيم {فَاطِرَ السَّمَاوَاتِ وَالْأَرْضِ أَنْتَ وَلِيِّي فِي الدُّنْيَا وَالْآخِرَةِ ۖ تَوَفَّنِي مُسْلِمًا وَأَلْحِقْنِي بِالصَّالِحِينَ} , [يوسف:١٠١] , صوت القارئ: عبدالباسط عبدالصمد.
  """,
    """بسم الله الرحمن الرحيم {رَبِّ أَنْزِلْنِي مُنْزَلًا مُبَارَكًا وَأَنْتَ خَيْرُ الْمُنْزِلِينَ} , [المؤمنون:٢٩] , صوت القارئ: ماهر المعيقلي."""
  ];

  static fillAudio() {
    for (int i = 0; i < AudioHelper.titles.length; i++) {
      Audio tempAudio = new Audio(
        "assets/audios/douaa_${i + 1}.mp3",
        metas: Metas(
          title: /*"${i+1} " +*/ AudioHelper.titles[i]
              .split('{')[1]
              .split('}')[0],
          artist: "Developed by Hakim Allaoui",
          album: Tools.packageInfo.appName,
          image: MetasImage.asset('assets/icon.png'),
        ),
      );
      AudioHelper.audios.add(tempAudio);
    }
  }
}
