import 'package:flutter/material.dart';
import 'package:talkative_missing/model/child.dart';
import 'package:talkative_missing/screens/detail_screen.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.child}) : super(key: key);

  final Child child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => DetailScreen(child: child))));
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(child.imageUrl),
                    radius: 32,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        child.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "실종일 ${DateTime.parse(child.occurDate).toString().substring(0, 10)}",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        "실종장소 ${child.occurAddress}",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
