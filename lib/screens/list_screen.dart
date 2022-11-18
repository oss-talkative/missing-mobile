import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talkative_missing/constants.dart';
import 'package:talkative_missing/model/child.dart';
import 'package:talkative_missing/model/children_response.dart';
import 'package:talkative_missing/screens/list_item.dart';
import 'dart:convert';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<List<Child>> children;

  @override
  void initState() {
    super.initState();
    children = fetchChildren();
  }

  Future<List<Child>> fetchChildren() async {
    var dio = Dio();
    final response = await dio.post(
        "https://www.safe182.go.kr/api/lcm/findChildList.do?esntlId=10000401&authKey=c8ebebd818f94fe6&rowSize=50");

    try {
      final ChildrenResponse children =
          ChildrenResponse.fromJson(json.decode(response.data));
      return children.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 42,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    cursorColor: kThemeColor,
                    keyboardType: TextInputType.text,
                    onChanged: (string) {},
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      fillColor: kLightGrey,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kLightGrey, width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kLightGrey, width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      hintText: '실종자 이름 검색',
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              Expanded(
                  child: FutureBuilder<List<Child>>(
                      future: children,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SingleChildScrollView(
                              child: Column(
                            children: List.generate(
                                snapshot.data!.length,
                                (index) =>
                                    ListItem(child: snapshot.data![index])),
                          ));
                        } else if (snapshot.hasError) {
                          return Center(child: Text("데이터를 불러올 수 없습니다"));
                        }
                        return Center(child: const CircularProgressIndicator());
                      }))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(
          'assets/images/pin.png',
          width: 24,
        ),
      ),
    );
  }
}
