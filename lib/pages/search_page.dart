import 'package:flutter/material.dart';
import 'package:weather_project/constants/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: <Widget>[
        Image.asset(
          "assets/bg.webp",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 70,
                child: TextField(
                  style: const TextStyle(
                    color: ColorsConstants.white,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Search for a city',
                      hintStyle: const TextStyle(
                        color: ColorsConstants.white,
                      ),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      filled: true,
                      fillColor:
                          ColorsConstants.whiteWithOpacity.withOpacity(0.5)),
                  onChanged: (value) => cityName = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff00A1FF).withOpacity(0.5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
