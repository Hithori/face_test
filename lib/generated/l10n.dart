// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Войти через ЕЛК`
  String get loginButtonLabel {
    return Intl.message(
      'Войти через ЕЛК',
      name: 'loginButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Войти без авторизации`
  String get signInWithoutAuth {
    return Intl.message(
      'Войти без авторизации',
      name: 'signInWithoutAuth',
      desc: '',
      args: [],
    );
  }

  /// `Уникальные сервисы`
  String get uniqueServices {
    return Intl.message(
      'Уникальные сервисы',
      name: 'uniqueServices',
      desc: '',
      args: [],
    );
  }

  /// `Воспользуйтесь удобством специальных сервисов для участников мероприятий`
  String get uniqueServicesDesc {
    return Intl.message(
      'Воспользуйтесь удобством специальных сервисов для участников мероприятий',
      name: 'uniqueServicesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Центр уведомлений`
  String get notificationCenter {
    return Intl.message(
      'Центр уведомлений',
      name: 'notificationCenter',
      desc: '',
      args: [],
    );
  }

  /// `Программа мероприятий`
  String get eventProgram {
    return Intl.message(
      'Программа мероприятий',
      name: 'eventProgram',
      desc: '',
      args: [],
    );
  }

  /// `Сразу после наступления события, мы уведомим вас сообщением на мобильном устройстве`
  String get notificationCenterDesc {
    return Intl.message(
      'Сразу после наступления события, мы уведомим вас сообщением на мобильном устройстве',
      name: 'notificationCenterDesc',
      desc: '',
      args: [],
    );
  }

  /// `Всегда под рукой актуальная информация о программе мероприятия`
  String get eventProgramDesc {
    return Intl.message(
      'Всегда под рукой актуальная информация о программе мероприятия',
      name: 'eventProgramDesc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
