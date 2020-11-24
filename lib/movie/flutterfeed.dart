import 'package:dart2xml/movie/flutterpics.dart';
import 'package:dart2xml/movie/fluttervideo.dart';
import 'package:dart2xml/wbui/stateful.dart';
import 'package:dart2xml/wbui/wbhtmlview.dart';
import 'package:dart2xml/wbui/wbimage.dart';
import 'package:flutter/material.dart';

Widget feed() {
  return Stateful(
    child: Container(
      child: GestureDetector(
        onTap: () {
          return "originJump(feedInfo.mid)";
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12, top: 10),
                  child: ClipOval(
                    child: WBImage(
                      url: "this.feedInfo.user.avatar_large",
                      size: Size(40, 40),
                    ),
                  ),
                ),
                Stateful(
                  child: Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 12, top: 8, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("名字"),
                        Text(
                          "描述",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )),
                ),
                Container(
                  width: 80,
                  height: 26,
                  margin: EdgeInsets.only(right: 12),
                  child: OutlineButton(
                    onPressed: () {
                      return "toFocus(weibouserInfo.id)";
                    },
                    borderSide: BorderSide(width: 1, color: Colors.orange),
                    splashColor: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.orange,
                        ),
                        Text(
                          "关注",
                          style: TextStyle(fontSize: 12, color: Colors.orange),
                        )
                      ],
                    ),
                    shape: StadiumBorder(),
                  ),
                )
              ],
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 12),
              child: WBHtmlView(
                html: "this.feedInfo.text",
                isContent: "true",
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            pics(),
            video(),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Container(
                      child: Text(
                    '2020 12-12 10:10:12',
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Color.fromRGBO(156, 156, 156, 1)),
                  )),
                  Spacer(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            return "toRepost";
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                WBImage(
                                  size: Size(18, 18),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color:
                                            Color.fromRGBO(156, 156, 156, 1)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            return "toRepost";
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                WBImage(
                                  size: Size(18, 18),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color:
                                            Color.fromRGBO(156, 156, 156, 1)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            return "toRepost";
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                WBImage(
                                  size: Size(18, 18),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color:
                                            Color.fromRGBO(156, 156, 156, 1)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(
                top: 10,
                left: 12,
                right: 12,
              ),
              color: Color.fromRGBO(156, 156, 156, 0.3),
            ),
            Container(
              height: 20,
            )
          ],
        ),
      ),
    ),
  );
}
