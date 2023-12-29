import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapid_apis/bloc/currency_bloc/currency_bloc.dart';
import 'package:rapid_apis/bloc/languages_bloc/languages_bloc.dart';
import 'package:rapid_apis/bloc/text_to_audio_bloc/text_to_audio_bloc.dart';
import 'package:rapid_apis/bloc/translation_bloc/translation_bloc.dart';
import 'package:rapid_apis/repository/currency_repo.dart';
import 'package:rapid_apis/repository/languages_repo.dart';
import 'package:rapid_apis/repository/text_to_audio_repo.dart';
import 'package:rapid_apis/ui/currency/currency_screen.dart';
import 'package:rapid_apis/ui/text_to_audio/text_to_audio_screen.dart';
import 'package:rapid_apis/ui/translate/translate_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Rapid Apis",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: [
                    Text(
                      "Translate text to 100+ languages ​. Fast processing, cost saving. Free up to 100,000 characters per month",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) =>
                                      LanguageBloc(repo: LanguageRepoImpl()),
                                ),
                                BlocProvider(
                                  create: (context) =>
                                      TranslationBloc(repo: LanguageRepoImpl()),
                                ),
                              ],
                              child: TranslateScreen(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Translation",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: [
                    Text(
                      "Convert text to audio quickly, supports over 100 languages ​​and 300+ speakers",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) => TextToAudioBloc(
                                      repo: TextToAudioRepoImpl()),
                                ),
                              ],
                              child: TextToAudioScreen(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Text to Audio",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: [
                    Text(
                      "Live currency and foreign exchange rates by specifying source and destination quotes and optionally amount to calculate. Support vast amount of quotes around the world.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) =>
                                      CurrencyBloc(repo: CurrencyRepoImpl()),
                                ),
                              ],
                              child: CurrencyScreen(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Currency exchange rates",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
