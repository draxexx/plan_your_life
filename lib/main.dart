import './index.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // ===============================================================
  // ============= APP-WISE CONTROLLER INITIALIZATIONS =============
  // ===============================================================
  //ignore: unused_field
  final TaskController _taskController = Get.put(TaskController());
  //ignore: unused_field
  final LabelController _labelController = Get.put(LabelController());
  // ===============================================================
  // =========== END APP-WISE CONTROLLER INITIALIZATIONS ===========
  // ===============================================================

  @override
  Widget build(BuildContext context) {
    // prevent rotation of screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: blueTheme(),
      supportedLocales: const [
        Locale("en", "US"),
        Locale("tr", "TR"),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: const HomeScreen(),
    );
  }
}
