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

  /// `Package Machine`
  String get package_machine {
    return Intl.message(
      'Package Machine',
      name: 'package_machine',
      desc: '',
      args: [],
    );
  }

  /// `Default Settings`
  String get default_settings {
    return Intl.message(
      'Default Settings',
      name: 'default_settings',
      desc: '',
      args: [],
    );
  }

  /// `Theme Setting：`
  String get theme_setting {
    return Intl.message(
      'Theme Setting：',
      name: 'theme_setting',
      desc: '',
      args: [],
    );
  }

  /// `Language Setting：`
  String get language_setting {
    return Intl.message(
      'Language Setting：',
      name: 'language_setting',
      desc: '',
      args: [],
    );
  }

  /// `Source Code Path：`
  String get source_code_path {
    return Intl.message(
      'Source Code Path：',
      name: 'source_code_path',
      desc: '',
      args: [],
    );
  }

  /// `Script Code Path：`
  String get script_code_path {
    return Intl.message(
      'Script Code Path：',
      name: 'script_code_path',
      desc: '',
      args: [],
    );
  }

  /// `Environment Choose：`
  String get environment_choose {
    return Intl.message(
      'Environment Choose：',
      name: 'environment_choose',
      desc: '',
      args: [],
    );
  }

  /// `Flavor Choose：`
  String get flavor_choose {
    return Intl.message(
      'Flavor Choose：',
      name: 'flavor_choose',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get chinese {
    return Intl.message(
      'Chinese',
      name: 'chinese',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `input can not empty`
  String get input_can_not_empty {
    return Intl.message(
      'input can not empty',
      name: 'input_can_not_empty',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `please input`
  String get please_input {
    return Intl.message(
      'please input',
      name: 'please_input',
      desc: '',
      args: [],
    );
  }

  /// `delete success`
  String get delete_success {
    return Intl.message(
      'delete success',
      name: 'delete_success',
      desc: '',
      args: [],
    );
  }

  /// `flavor`
  String get flavor {
    return Intl.message(
      'flavor',
      name: 'flavor',
      desc: '',
      args: [],
    );
  }

  /// `environment`
  String get environment {
    return Intl.message(
      'environment',
      name: 'environment',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message(
      'save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `please input flutter project git url path or full directory`
  String get please_input_source_code_path {
    return Intl.message(
      'please input flutter project git url path or full directory',
      name: 'please_input_source_code_path',
      desc: '',
      args: [],
    );
  }

  /// `please input script project git url path or full directory`
  String get please_input_script_code_path {
    return Intl.message(
      'please input script project git url path or full directory',
      name: 'please_input_script_code_path',
      desc: '',
      args: [],
    );
  }

  /// `Input Dialog`
  String get input_dialog {
    return Intl.message(
      'Input Dialog',
      name: 'input_dialog',
      desc: '',
      args: [],
    );
  }

  /// `Error Dialog`
  String get error_dialog {
    return Intl.message(
      'Error Dialog',
      name: 'error_dialog',
      desc: '',
      args: [],
    );
  }

  /// `Server Return Code 0`
  String get server_return_code_0 {
    return Intl.message(
      'Server Return Code 0',
      name: 'server_return_code_0',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get unknown_error {
    return Intl.message(
      'Unknown Error',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Request Error`
  String get request_error {
    return Intl.message(
      'Request Error',
      name: 'request_error',
      desc: '',
      args: [],
    );
  }

  /// `Connect Error`
  String get connect_error {
    return Intl.message(
      'Connect Error',
      name: 'connect_error',
      desc: '',
      args: [],
    );
  }

  /// `Certificate Error`
  String get certificate_error {
    return Intl.message(
      'Certificate Error',
      name: 'certificate_error',
      desc: '',
      args: [],
    );
  }

  /// `Receive Timeout`
  String get receive_timeout {
    return Intl.message(
      'Receive Timeout',
      name: 'receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Send Timeout`
  String get send_timeout {
    return Intl.message(
      'Send Timeout',
      name: 'send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Connect Timeout`
  String get connect_timeout {
    return Intl.message(
      'Connect Timeout',
      name: 'connect_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Response Cancel`
  String get request_cancel {
    return Intl.message(
      'Response Cancel',
      name: 'request_cancel',
      desc: '',
      args: [],
    );
  }

  /// `No Permission`
  String get no_permission {
    return Intl.message(
      'No Permission',
      name: 'no_permission',
      desc: '',
      args: [],
    );
  }

  /// `Server Refuse Do`
  String get server_refuse_do {
    return Intl.message(
      'Server Refuse Do',
      name: 'server_refuse_do',
      desc: '',
      args: [],
    );
  }

  /// `Connect Server Fail`
  String get connect_server_fail {
    return Intl.message(
      'Connect Server Fail',
      name: 'connect_server_fail',
      desc: '',
      args: [],
    );
  }

  /// `Request Method Prohibited`
  String get request_method_prohibited {
    return Intl.message(
      'Request Method Prohibited',
      name: 'request_method_prohibited',
      desc: '',
      args: [],
    );
  }

  /// `Server Internal Error`
  String get server_internal_error {
    return Intl.message(
      'Server Internal Error',
      name: 'server_internal_error',
      desc: '',
      args: [],
    );
  }

  /// `Ineffective Request`
  String get ineffective_request {
    return Intl.message(
      'Ineffective Request',
      name: 'ineffective_request',
      desc: '',
      args: [],
    );
  }

  /// `Server Die`
  String get server_die {
    return Intl.message(
      'Server Die',
      name: 'server_die',
      desc: '',
      args: [],
    );
  }

  /// `Not Support Http Request`
  String get not_support_http_request {
    return Intl.message(
      'Not Support Http Request',
      name: 'not_support_http_request',
      desc: '',
      args: [],
    );
  }

  /// `Add Package Task`
  String get add_package_task {
    return Intl.message(
      'Add Package Task',
      name: 'add_package_task',
      desc: '',
      args: [],
    );
  }

  /// `Task Name：`
  String get task_name {
    return Intl.message(
      'Task Name：',
      name: 'task_name',
      desc: '',
      args: [],
    );
  }

  /// `please input task name`
  String get please_input_task_name {
    return Intl.message(
      'please input task name',
      name: 'please_input_task_name',
      desc: '',
      args: [],
    );
  }

  /// `Package Platform`
  String get package_platform {
    return Intl.message(
      'Package Platform',
      name: 'package_platform',
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
      Locale.fromSubtags(languageCode: 'zh'),
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
