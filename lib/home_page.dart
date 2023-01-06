import 'package:aara_app/chart.dart';
import 'package:aara_app/model/aara_model.dart';
import 'package:aara_app/services/api.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AaraModel? aaraModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    isLoading = true;
    aaraModel = await API.getAPI();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: const CircleAvatar(
              radius: 5,
              child: Text("SK"),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Siddhant Kumar", style: TextStyle(fontSize: 16)),
                Text("Flutter Developer", style: TextStyle(fontSize: 14)),
              ],
            ),
            elevation: 0),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Colors.white12,
                      Colors.white12,
                      Colors.black12,
                      Colors.black
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.amber,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: 'How\'\s the ',
                            style: TextStyle(fontSize: 24),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Mood',
                                  style: TextStyle(color: Colors.amber)),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        const Text(
                          "Today",
                          style: TextStyle(fontSize: 24),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              EmojiWidget(emoji: '😀'),
                              EmojiWidget(emoji: '😇'),
                              EmojiWidget(emoji: '😑'),
                              EmojiWidget(emoji: '😞'),
                              EmojiWidget(emoji: '😡'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20)
                      ]),
                ),
              ),
              SizedBox(height: 5),
              Divider(color: Colors.white, thickness: 1),
              Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(children: [
                      Row(
                        children: [
                          Text(
                            "Team Mood",
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Divider(
                                color: Colors.white, thickness: 1, height: 2),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.white12,
                                  Colors.white12,
                                  Colors.black12,
                                  Colors.black
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            border: Border.all(
                              width: 1.5,
                              color: Colors.amber,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  " The team is feeling good today",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              EmojiWidget(emoji: "😇")
                            ],
                          ),
                        ),
                      )
                    ]),
                  )),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    ListTile(
                      leading: EmojiWidget(
                        emoji: "😇",
                        size: 30,
                      ),
                      title: Text(
                        "Moodalytics",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Text(
                        "(Trend chart on Mood)",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: LineChartWidget(
                            chartData: [
                              ChartData(
                                  aaraModel!.moodalytics[0].createdAt,
                                  aaraModel!.moodalytics[0].emojiPoint
                                      .toDouble()),
                              ChartData(
                                  aaraModel!.moodalytics[1].createdAt,
                                  aaraModel!.moodalytics[1].emojiPoint
                                      .toDouble()),
                              ChartData(
                                  aaraModel!.moodalytics[2].createdAt,
                                  aaraModel!.moodalytics[2].emojiPoint
                                      .toDouble()),
                              ChartData(
                                  aaraModel!.moodalytics[3].createdAt,
                                  aaraModel!.moodalytics[3].emojiPoint
                                      .toDouble()),
                              ChartData(
                                  aaraModel!.moodalytics[4].createdAt,
                                  aaraModel!.moodalytics[4].emojiPoint
                                      .toDouble()),
                              ChartData(
                                  aaraModel!.moodalytics[5].createdAt,
                                  aaraModel!.moodalytics[5].emojiPoint
                                      .toDouble()),
                              ChartData(
                                  aaraModel!.moodalytics[6].createdAt,
                                  aaraModel!.moodalytics[6].emojiPoint
                                      .toDouble()),
                            ],
                          )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmojiWidget extends StatelessWidget {
  final String emoji;
  final double? size;
  const EmojiWidget({Key? key, required this.emoji, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      emoji,
      style: TextStyle(fontSize: size ?? 40),
    );
  }
}
