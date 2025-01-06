import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocaleData.EN),
  MapLocale("kh", LocaleData.KH),
  MapLocale("ch", LocaleData.CH),
];

mixin LocaleData {
  static const String welcome = 'welcome';
  static const String loginTitle = "login Title";
  static const String signupTitle = "signup Title";
  static const String login = "login";
  static const String signup = "signup";
  static const String phone = "phonenumber";
  static const String password = "password";
  static const String confirm = "Confirm";
  static const String forgot = "Forgot Password";
  static const String dont = "Don't have an account?";
  static const String have = "Already have an account?";
  static const String remember = "Remember me";
  static const String firstName = "First Name";
  static const String lastName = "Last Name";
  static const String confirmPassword = "Confirm Password";
  static const String continues = "Continue";
  static const String skip = "Skip";
  static const String home = "Home";
  static const String request = "Request Donation";
  static const String donation = "Donation Request";
  static const String formrequest = "Request Blood";
  static const String requestType = "Request Type";
  static const String report = "Report";
  static const String donor = "Find Donor";
  static const String search = "Search";
  static const String cancel = "Cancel";
  static const String accept = "Accept";
  static const String reject = "Reject";
  static const String donate = "Donate";
  static const String complete = "Complete";
  static const String profile = "Profile";
  static const String notification = "Notification";
  static const String setting = "Setting";
  static const String signout = "Sign Out";
  static const String avaible = "Available for donate";
  static const String invite = "Invite a friend";
  static const String edit = "Edit profile";
  static const String dark = "Dark mode";
  static const String language = "Language";
  static const String help = "Help";
  static const String security = "Security";
  static const String location = "Location";
  static const String time = "Time";
  static const String name = "Name";
  static const String note = "Add Note";
  static const String bloodType = "Blood Type";
  static const String required = "is required";

  static const Map<String, dynamic> EN = {
    welcome: 'Welcome!',
    loginTitle: "Login to get started",
    signupTitle: "Sign up to get started",
    login: "Login",
    signup: "Sign Up",
    phone: "Phone Number",
    password: "Password",
    confirm: "Confirm",
    forgot: "Forgot Password",
    dont: "Don't have an account?",
    have: "Already have an account?",
    remember: "Remember me",
    firstName: "First Name",
    lastName: "Last Name",
    confirmPassword: "Confirm Password",
    continues: "Continue",
    skip: "Skip",
    home: "Home",
    search: "Search",
    request: "Request Donation",
    donation: "Donation Request",
    formrequest: "Request Blood",
    report: "Report",
    donor: "Find Donor",
    cancel: "Cancel",
    accept: "Accept",
    reject: "Reject",
    donate: "Donate",
    complete: "Complete",
    profile: "Profile",
    notification: "Notification",
    setting: "Setting",
    signout: "Sign Out",
    avaible: "Available for donate",
    invite: "Invite a friend",
    edit: "Edit profile",
    dark: "Dark mode",
    time: "Time",
    location: "Location",
    language: "Language",
    name: "Name",
    security: "Security",
    help: "Help",
    bloodType: "Blood Type",
    requestType: "Request Type",
    note: "Add Note",
    required: "is required",
  };

  static const Map<String, dynamic> KH = {
    welcome: 'សូមស្វាគមន៍!',
    loginTitle: "ចូលដើម្បីចាប់ផ្តើម",
    signupTitle: "ចុះឈ្មោះដើម្បីចាប់ផ្តើម",
    login: "ចូល",
    signup: "ចុះឈ្មោះ",
    phone: "លេខទូរស័ព្ទ",
    password: "ពាក្យសម្ងាត់",
    confirm: "បញ្ជាក់",
    forgot: "ភ្លេចពាក្យសម្ងាត់",
    dont: "មិនមានគណនីទេ?",
    have: "មានគណនីរួចហើយ?",
    remember: "ចងចាំខ្ញុំ",
    firstName: "នាមខ្លួន",
    lastName: "នាមត្រកូល",
    confirmPassword: "បញ្ជាក់ពាក្យសម្ងាត់",
    continues: "បន្ត",
    skip: "រំលង",
    home: "ទំព័រដើម",
    search: "ស្វែងរក",
    request: "សុំការបរិចាក",
    donation: "សុំបរិចាកឈាម",
    formrequest: "ស្នើសុំសំណើសប្រភេទឈាម",
    report: "របាយការណ៍",
    donor: "ស្វែងរកអ្នកបរិចាក",
    cancel: "បោះបង់",
    accept: "ទទួលយក",
    reject: "បដិសេធ",
    donate: "បរិចាក",
    complete: "បញ្ចប់",
    profile: "ប្រវត្តិរូប",
    notification: "សេចក្តីជូនដំណឹង",
    setting: "ការកំណត់",
    signout: "ចេញ",
    avaible: "អាចបរិចាក",
    invite: "អញ្ជើញមិត្តភក្ដិ",
    edit: "កែប្រែប្រវត្តិរូប",
    dark: "ផ្ទៃងងឹត",
    time: "ពេលវេលា",
    location: "ទីតាំង",
    name: "ឈ្មោះ",
    security: "សុវត្ថិភាព",
    help: "ជំនួយ",
    language: "ភាសា",
    bloodType: "ប្រភេទឈាម",
    note: "ចំណាំ",
    requestType: "ប្រភេទសំណើ",
    required: "ចំណាំបាច់"
  };

  static const Map<String, dynamic> CH = {
    welcome: "欢迎",
    loginTitle: "登录以开始使用",
    signupTitle: '注册以开始使用',
    login: "登录",
    signup: "注册",
    phone: "电话号码",
    password: "密码",
    confirm: "确认",
    forgot: "忘记密码",
    dont: "没有帐号?",
    have: "已经有帐号?",
    remember: "记住我",
    firstName: "名字",
    lastName: "姓氏",
    confirmPassword: "确认密码",
    continues: "继续",
    skip: "跳过",
    home: "主页",
    search: "搜索",
    request: "请求捐赠",
    donation: "捐赠请求",
    formrequest: "请求血液",
    report: "报告",
    donor: "找到捐赠者",
    cancel: "取消",
    accept: "接受",
    reject: "拒绝",
    donate: "捐赠",
    complete: "完成",
    profile: "个人资料",
    notification: "通知",
    setting: "设置",
    signout: "登出",
    avaible: "可以捐赠",
    invite: "邀请朋友",
    edit: "编辑个人资料",
    dark: "暗模式",
    time: "时间",
    location: "位置",
    name: "名字",
    security: "安全",
    help: "帮助",
    bloodType: "血型",
    note: "添加备注",
    language: "语言",
    requestType: '',
    required: ''
  };
}
