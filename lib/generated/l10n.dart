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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Mr, User Name`
  String get userNameTitle {
    return Intl.message(
      'Mr, User Name',
      name: 'userNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Your Dashboard`
  String get welcomeDashboard {
    return Intl.message(
      'Welcome to Your Dashboard',
      name: 'welcomeDashboard',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Exam Title`
  String get examTitleLabel {
    return Intl.message(
      'Exam Title',
      name: 'examTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g., Mid-Term Biology Exam`
  String get examTitleHint {
    return Intl.message(
      'e.g., Mid-Term Biology Exam',
      name: 'examTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Upload Lessons`
  String get uploadLessons {
    return Intl.message(
      'Upload Lessons',
      name: 'uploadLessons',
      desc: '',
      args: [],
    );
  }

  /// `Create Exam`
  String get createExam {
    return Intl.message('Create Exam', name: 'createExam', desc: '', args: []);
  }

  /// `Manage Files`
  String get manageFiles {
    return Intl.message(
      'Manage Files',
      name: 'manageFiles',
      desc: '',
      args: [],
    );
  }

  /// `Student List`
  String get studentList {
    return Intl.message(
      'Student List',
      name: 'studentList',
      desc: '',
      args: [],
    );
  }

  /// `Grades`
  String get grades {
    return Intl.message('Grades', name: 'grades', desc: '', args: []);
  }

  /// `Announcements`
  String get announcements {
    return Intl.message(
      'Announcements',
      name: 'announcements',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get students {
    return Intl.message('Students', name: 'students', desc: '', args: []);
  }

  /// `Classes`
  String get classes {
    return Intl.message('Classes', name: 'classes', desc: '', args: []);
  }

  /// `New Submissions`
  String get newSubmissions {
    return Intl.message(
      'New Submissions',
      name: 'newSubmissions',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Exams`
  String get upcomingExams {
    return Intl.message(
      'Upcoming Exams',
      name: 'upcomingExams',
      desc: '',
      args: [],
    );
  }

  /// `Quick Access`
  String get quickAccess {
    return Intl.message(
      'Quick Access',
      name: 'quickAccess',
      desc: '',
      args: [],
    );
  }

  /// `Teacher Subject ID`
  String get teacherSubjectId {
    return Intl.message(
      'Teacher Subject ID',
      name: 'teacherSubjectId',
      desc: '',
      args: [],
    );
  }

  /// `Enter Teacher Subject ID`
  String get enterTeacherSubjectId {
    return Intl.message(
      'Enter Teacher Subject ID',
      name: 'enterTeacherSubjectId',
      desc: '',
      args: [],
    );
  }

  /// `Enter an ID to load lessons`
  String get enterIdToLoadLessons {
    return Intl.message(
      'Enter an ID to load lessons',
      name: 'enterIdToLoadLessons',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `username@gmail.com`
  String get email {
    return Intl.message(
      'username@gmail.com',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Subjects`
  String get subjects {
    return Intl.message('Subjects', name: 'subjects', desc: '', args: []);
  }

  /// `Lessons`
  String get lessons {
    return Intl.message('Lessons', name: 'lessons', desc: '', args: []);
  }

  /// `Share App`
  String get shareApp {
    return Intl.message('Share App', name: 'shareApp', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message('Sign Out', name: 'signOut', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Copied!`
  String get copied {
    return Intl.message('Copied!', name: 'copied', desc: '', args: []);
  }

  /// `All Lessons`
  String get allLessons {
    return Intl.message('All Lessons', name: 'allLessons', desc: '', args: []);
  }

  /// `All Subjects`
  String get allSubjects {
    return Intl.message(
      'All Subjects',
      name: 'allSubjects',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Prev`
  String get prev {
    return Intl.message('Prev', name: 'prev', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Empower Your\n Mind with Us`
  String get onBoardingTitle1 {
    return Intl.message(
      'Empower Your\n Mind with Us',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Every great journey begins with curiosity,\nLet’s unlock the power of your mind together.`
  String get onBoardingSubtitle1 {
    return Intl.message(
      'Every great journey begins with curiosity,\nLet’s unlock the power of your mind together.',
      name: 'onBoardingSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Unlock Your Learning\n               Potential`
  String get onBoardingTitle2 {
    return Intl.message(
      'Unlock Your Learning\n               Potential',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `You already have what it takes — we’ll help you bring it to life.`
  String get onBoardingSubtitle2 {
    return Intl.message(
      'You already have what it takes — we’ll help you bring it to life.',
      name: 'onBoardingSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Dive into Your First\n             Lesson!`
  String get onBoardingTitle3 {
    return Intl.message(
      'Dive into Your First\n             Lesson!',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Start your learning adventure today — your future self will thank you!`
  String get onBoardingSubtitle3 {
    return Intl.message(
      'Start your learning adventure today — your future self will thank you!',
      name: 'onBoardingSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordLabel {
    return Intl.message(
      'New Password',
      name: 'newPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password required`
  String get passwordRequired {
    return Intl.message(
      'Password required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Required 8 characters or higher`
  String get passwordLengthError {
    return Intl.message(
      'Required 8 characters or higher',
      name: 'passwordLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Successfully`
  String get passwordChangedSuccess {
    return Intl.message(
      'Password Changed Successfully',
      name: 'passwordChangedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordButton {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verifyOtpTitle {
    return Intl.message(
      'Verify OTP',
      name: 'verifyOtpTitle',
      desc: '',
      args: [],
    );
  }

  /// `OTP Code`
  String get otpLabel {
    return Intl.message('OTP Code', name: 'otpLabel', desc: '', args: []);
  }

  /// `OTP required`
  String get otpRequired {
    return Intl.message(
      'OTP required',
      name: 'otpRequired',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verified!`
  String get otpVerified {
    return Intl.message(
      'OTP Verified!',
      name: 'otpVerified',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verifyButton {
    return Intl.message('Verify', name: 'verifyButton', desc: '', args: []);
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `Enter OTP`
  String get enterOtp {
    return Intl.message('Enter OTP', name: 'enterOtp', desc: '', args: []);
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Forget Password ?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and\nwe’ll send a confirmation code`
  String get enterEmailSubtitle {
    return Intl.message(
      'Enter your email address and\nwe’ll send a confirmation code',
      name: 'enterEmailSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailHint {
    return Intl.message('Email', name: 'emailHint', desc: '', args: []);
  }

  /// `Continue`
  String get continuee {
    return Intl.message('Continue', name: 'continuee', desc: '', args: []);
  }

  /// `Failed to send OTP`
  String get failedToSendOtp {
    return Intl.message(
      'Failed to send OTP',
      name: 'failedToSendOtp',
      desc: '',
      args: [],
    );
  }

  /// `OTP incorrect`
  String get otpIncorrect {
    return Intl.message(
      'OTP incorrect',
      name: 'otpIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Resetting password failed`
  String get resetPasswordFailed {
    return Intl.message(
      'Resetting password failed',
      name: 'resetPasswordFailed',
      desc: '',
      args: [],
    );
  }

  /// `Login failed, please try again`
  String get loginFailed {
    return Intl.message(
      'Login failed, please try again',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Logout failed`
  String get logoutFailed {
    return Intl.message(
      'Logout failed',
      name: 'logoutFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send OTP`
  String get otpSendFailed {
    return Intl.message(
      'Failed to send OTP',
      name: 'otpSendFailed',
      desc: '',
      args: [],
    );
  }

  /// `OTP verification failed`
  String get otpVerifyFailed {
    return Intl.message(
      'OTP verification failed',
      name: 'otpVerifyFailed',
      desc: '',
      args: [],
    );
  }

  /// `Reset failed`
  String get resetFailed {
    return Intl.message(
      'Reset failed',
      name: 'resetFailed',
      desc: '',
      args: [],
    );
  }

  /// `I Already Have an Account `
  String get haveAccount {
    return Intl.message(
      'I Already Have an Account ',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Login successful`
  String get loginSuccess {
    return Intl.message(
      'Login successful',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Back!`
  String get back {
    return Intl.message('Back!', name: 'back', desc: '', args: []);
  }

  /// `Username or Email`
  String get usernameOrEmail {
    return Intl.message(
      'Username or Email',
      name: 'usernameOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Failed to create lesson`
  String get failedToCreateLesson {
    return Intl.message(
      'Failed to create lesson',
      name: 'failedToCreateLesson',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update lesson`
  String get failedToUpdateLesson {
    return Intl.message(
      'Failed to update lesson',
      name: 'failedToUpdateLesson',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete lesson`
  String get failedToDeleteLesson {
    return Intl.message(
      'Failed to delete lesson',
      name: 'failedToDeleteLesson',
      desc: '',
      args: [],
    );
  }

  /// `Lesson Created Successfully`
  String get lessonCreatedSuccessfully {
    return Intl.message(
      'Lesson Created Successfully',
      name: 'lessonCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Lessons Details`
  String get lessonsDetails {
    return Intl.message(
      'Lessons Details',
      name: 'lessonsDetails',
      desc: '',
      args: [],
    );
  }

  /// `Subject Id`
  String get subjectId {
    return Intl.message('Subject Id', name: 'subjectId', desc: '', args: []);
  }

  /// `Lesson Title`
  String get lessonTitle {
    return Intl.message(
      'Lesson Title',
      name: 'lessonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lesson Description`
  String get lessonDescription {
    return Intl.message(
      'Lesson Description',
      name: 'lessonDescription',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get sort {
    return Intl.message('Sort', name: 'sort', desc: '', args: []);
  }

  /// `Create Lesson`
  String get createLesson {
    return Intl.message(
      'Create Lesson',
      name: 'createLesson',
      desc: '',
      args: [],
    );
  }

  /// `Create New Lesson`
  String get createnewLesson {
    return Intl.message(
      'Create New Lesson',
      name: 'createnewLesson',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Created`
  String get examCreatedSuccess {
    return Intl.message(
      'Successfully Created',
      name: 'examCreatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Create Exam`
  String get examCreateFailed {
    return Intl.message(
      'Failed to Create Exam',
      name: 'examCreateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Exam Details`
  String get examDetails {
    return Intl.message(
      'Exam Details',
      name: 'examDetails',
      desc: '',
      args: [],
    );
  }

  /// `Exam Title`
  String get examTitle {
    return Intl.message('Exam Title', name: 'examTitle', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Exam URL`
  String get examUrl {
    return Intl.message('Exam URL', name: 'examUrl', desc: '', args: []);
  }

  /// `e.g., https://examplatform.com/exam123`
  String get examUrlHint {
    return Intl.message(
      'e.g., https://examplatform.com/exam123',
      name: 'examUrlHint',
      desc: '',
      args: [],
    );
  }

  /// `Instructions for the exam`
  String get examInstructionsHint {
    return Intl.message(
      'Instructions for the exam',
      name: 'examInstructionsHint',
      desc: '',
      args: [],
    );
  }

  /// `View Exams`
  String get viewExams {
    return Intl.message('View Exams', name: 'viewExams', desc: '', args: []);
  }

  /// `Create Exam`
  String get createExamButton {
    return Intl.message(
      'Create Exam',
      name: 'createExamButton',
      desc: '',
      args: [],
    );
  }

  /// `Exams View Coming Soon`
  String get examsViewComingSoon {
    return Intl.message(
      'Exams View Coming Soon',
      name: 'examsViewComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Create New Exam`
  String get createNewExam {
    return Intl.message(
      'Create New Exam',
      name: 'createNewExam',
      desc: '',
      args: [],
    );
  }

  /// `All Exams`
  String get allExams {
    return Intl.message('All Exams', name: 'allExams', desc: '', args: []);
  }

  /// `Select a date`
  String get selectDate {
    return Intl.message(
      'Select a date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Schedule`
  String get schedule {
    return Intl.message('Schedule', name: 'schedule', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
