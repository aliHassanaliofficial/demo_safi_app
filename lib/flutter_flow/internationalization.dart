import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '66s2qhrl': {
      'en': 'EN',
      'ar': 'العربية',
    },
    'bb5bdhuq': {
      'en': 'Get started',
      'ar': 'البدء',
    },
    'ecqib467': {
      'en': 'WELCOME TO THE ARAB REPUBLIC OF EGYPT',
      'ar': 'مرحباً بكم في جمهورية مصر العربية',
    },
    '4kbdqwx0': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Au
  {
    'o8f88dlv': {
      'en':
          'Welcome to SAFI AI\nTOURIST ASSISTANT\nThe first AI tourism assistance solution',
      'ar':
          'مرحبًا بكم في SAFI AI\nTOURIST ASSISTANT\nأول حل للمساعدة السياحية بالذكاء الاصطناعي',
    },
    'h27c4ypu': {
      'en': 'I have already an account',
      'ar': 'لدي حساب بالفعل',
    },
    'pwo1k3rv': {
      'en': 'Start a new journey',
      'ar': 'ابدأ رحلة جديدة',
    },
    '8c3ziaiw': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Details05Event
  {
    '2qjg9uzn': {
      'en': 'Marina ElAlamin city',
      'ar': 'مدينة مارينا العلمين',
    },
    '4gbl5dov': {
      'en': '12:30pm',
      'ar': '12:30 ظهرا',
    },
    'mvmxwxzf': {
      'en': 'Main  Center Stage',
      'ar': 'مركز المسرح الرئيسي',
    },
    'wo2ormd8': {
      'en':
          'By protecting and preserving our oceans, we can effectively reduce global warming as healthy...',
      'ar':
          'من خلال حماية محيطاتنا والحفاظ عليها، يمكننا الحد من ظاهرة الاحتباس الحراري بشكل فعال كبيئة صحية...',
    },
    '23g3ritb': {
      'en':
          'By protecting and preserving our oceans, we can effectively reduce global warming as healthy oceans absorb a significant amount of atmospheric carbon dioxide. Implementing measures to prevent overfishing, reducing plastic pollution, and conserving marine habitats will contribute to a balanced ocean ecosystem, ultimately mitigating global warming.',
      'ar':
          'من خلال حماية محيطاتنا والحفاظ عليها، يمكننا الحد بشكل فعال من ظاهرة الاحتباس الحراري العالمي، حيث تمتص المحيطات الصحية كمية كبيرة من ثاني أكسيد الكربون في الغلاف الجوي. إن تنفيذ التدابير لمنع الصيد الجائر، والحد من التلوث البلاستيكي، والحفاظ على الموائل البحرية من شأنه أن يساهم في تحقيق توازن النظام البيئي للمحيطات، مما يؤدي في نهاية المطاف إلى التخفيف من ظاهرة الاحتباس الحراري العالمي.',
    },
    'q4fe6era': {
      'en': 'Featured Speakers',
      'ar': 'المتحدثون المميزون',
    },
    'jr4bc1t1': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    'kcvlvhc2': {
      'en': '13 Smouha Street, Sidi Gaber',
      'ar': '13 شارع سموحة، سيدي جابر',
    },
    'g1ht1rcf': {
      'en': 'Izbat saad, Victor Amaonil',
      'ar': 'عزبة سعد، فيكتور عمونيل',
    },
    '5zpkhlqw': {
      'en': 'Get Tickets',
      'ar': 'احصل على التذاكر',
    },
    '7a3n4ci1': {
      'en': 'View in Map',
      'ar': 'عرض على الخريطة',
    },
    'szfv5kk2': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Miscellaneous
  {
    'eh8ifntw': {
      'en': 'For the application demo version testing',
      'ar': '',
    },
    'eljppn4f': {
      'en': 'For the application demo version testing',
      'ar': '',
    },
    'bdqft7v1': {
      'en': 'For the application demo version testing',
      'ar': '',
    },
    'nggxjmij': {
      'en': 'For the application demo version testing',
      'ar': '',
    },
    '1kvw2b07': {
      'en': '',
      'ar': '',
    },
    'e8ovheyx': {
      'en': '',
      'ar': '',
    },
    '2zaombd5': {
      'en': '',
      'ar': '',
    },
    'cs7ehwh4': {
      'en': '',
      'ar': '',
    },
    '8kc8wwdw': {
      'en': '',
      'ar': '',
    },
    'mmbnxymb': {
      'en': '',
      'ar': '',
    },
    '5yylilr3': {
      'en': '',
      'ar': '',
    },
    '7jcmuqx2': {
      'en': '',
      'ar': '',
    },
    '5islrd04': {
      'en': '',
      'ar': '',
    },
    'i1snt21l': {
      'en': '',
      'ar': '',
    },
    'ry7hd1jk': {
      'en': '',
      'ar': '',
    },
    'u1x02k1t': {
      'en': '',
      'ar': '',
    },
    'tr6fxk48': {
      'en': '',
      'ar': '',
    },
    'tms9usvm': {
      'en': '',
      'ar': '',
    },
    '93aihhw6': {
      'en': '',
      'ar': '',
    },
    'kg6nm6do': {
      'en': '',
      'ar': '',
    },
    'cp00xnv1': {
      'en': '',
      'ar': '',
    },
    'wixuucks': {
      'en': '',
      'ar': '',
    },
    'w8ojp4yt': {
      'en': '',
      'ar': '',
    },
    '0lg6rkrb': {
      'en': '',
      'ar': '',
    },
    '1mztkeon': {
      'en': '',
      'ar': '',
    },
    'ljvosr4l': {
      'en': '',
      'ar': '',
    },
    'dv3nu30u': {
      'en': '',
      'ar': '',
    },
    'cf7y38zt': {
      'en': '',
      'ar': '',
    },
    'ixf6a5ek': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
