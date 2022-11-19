import 'package:flutter/material.dart';
import 'package:talkative_missing/constants.dart';
import 'package:talkative_missing/model/child.dart';
import 'package:talkative_missing/screens/report_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.child}) : super(key: key);

  final Child child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "실종자 상세조회",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: ((context) => Container(
                            height: 235,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                )),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "이 사람을 발견하셨나요?",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  SizedBox(
                                    width: size.width - 64,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReportScreen(
                                                        child: child,
                                                      )));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.fmd_bad,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "네, 발견했어요.",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 18,
                                              )
                                            ],
                                          ),
                                        ),
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(64),
                                          ),
                                        ))),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: size.width - 64,
                                    child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.undo,
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                "잘못 눌렀어요.",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                width: 18,
                                              )
                                            ],
                                          ),
                                        ),
                                        style: ButtonStyle(
                                            side: MaterialStateProperty.all(
                                                BorderSide(
                                                    color: Colors.grey,
                                                    width: 2)),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(72),
                                                  side: BorderSide(
                                                      color: Colors.grey,
                                                      width: 2)),
                                            ))),
                                  )
                                ],
                              ),
                            ),
                          )));
                },
                child: Text(
                  "제보",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ))),
          )
        ],
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width - 40,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(child.imageUrl),
                          radius: size.width / 4,
                        ),
                        SizedBox(height: 12),
                        Text(
                          child.name,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: kThemeColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "실종일",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            DateTime.parse(child.occurDate)
                                .toString()
                                .substring(0, 10),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "실종 당시 나이",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text("${child.occurAge}세",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "현재 나이",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text("${child.currentAge}세",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "실종 장소",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(child.occurAddress,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "실종 유형",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            typeMap[child.type] ?? "정보없음",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "성별",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(child.sex,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: size.width / 2.25,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "인상 착의",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(child.dress,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "기타 특징",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(child.features,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
