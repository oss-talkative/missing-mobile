import 'package:flutter/material.dart';
import 'package:talkative_missing/constants.dart';
import 'package:talkative_missing/model/child.dart';

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
        actions: [TextButton(onPressed: () {}, child: Text("제보"))],
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
