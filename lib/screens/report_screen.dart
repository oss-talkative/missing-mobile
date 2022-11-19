import 'package:flutter/material.dart';
import 'package:talkative_missing/constants.dart';
import 'package:talkative_missing/model/child.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key, required this.child}) : super(key: key);

  final Child child;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String reportText = "";

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
            "발견 제보하기",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: ((context) => Container(
                          height: 215,
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
                                SizedBox(
                                  width: size.width - 64,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.delete_forever,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "그만 작성하고 나가기",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 24,
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
                                              Icons.queue_play_next,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              "계속 작성하기",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                            ),
                                            SizedBox(
                                              width: 24,
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
              icon: Icon(Icons.close, color: Colors.grey)),
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
                                      "이대로 제보하시겠어요?",
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
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  "발견 제보하기",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  width: 24,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.undo,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  "내용 다시 검토하기",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  width: 24,
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
                                                        BorderRadius.circular(
                                                            72),
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    color: kLightGrey, borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  onChanged: (value) {
                    reportText = value;
                  },
                  cursorColor: kThemeColor,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    fillColor: kLightGrey,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kLightGrey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kLightGrey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: '발견 당시 장소 및 추가 정보 입력',
                  ),
                  maxLines: null,
                ),
              ),
            ),
          ],
        ));
  }
}
