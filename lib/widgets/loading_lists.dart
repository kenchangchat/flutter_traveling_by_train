import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class LoadingLists extends StatefulWidget {
  @override
  _LoadingListsState createState() => _LoadingListsState();
}

class _LoadingListsState extends State<LoadingLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
        color: COLOR_THEME_MAIN,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: COLOR_THEME_SHADOW,
            spreadRadius: 0.1,
            blurRadius: 10,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 80,
                margin: EdgeInsets.only(top: 5, right: 5),
                decoration: BoxDecoration(
                  color: COLOR_THEME_SHADOW_LIGHT,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          margin: EdgeInsets.only(top: 5, right: 5),
                          decoration: BoxDecoration(
                            color: COLOR_THEME_SHADOW_LIGHT,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          margin: EdgeInsets.only(top: 5, right: 5),
                          decoration: BoxDecoration(
                            color: COLOR_THEME_SHADOW_LIGHT,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          margin: EdgeInsets.only(top: 5, right: 5),
                          decoration: BoxDecoration(
                            color: COLOR_THEME_SHADOW_LIGHT,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 15,
                                margin: EdgeInsets.only(top: 5, right: 5),
                                decoration: BoxDecoration(
                                  color: COLOR_THEME_SHADOW_LIGHT,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 15,
                                margin: EdgeInsets.only(top: 5, right: 5),
                                decoration: BoxDecoration(
                                  color: COLOR_THEME_SHADOW_LIGHT,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 15,
                                margin: EdgeInsets.only(top: 5, right: 5),
                                decoration: BoxDecoration(
                                  color: COLOR_THEME_SHADOW_LIGHT,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 15,
                                margin: EdgeInsets.only(top: 5, right: 5),
                                decoration: BoxDecoration(
                                  color: COLOR_THEME_SHADOW_LIGHT,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 15,
                                margin: EdgeInsets.only(top: 5, right: 5),
                                decoration: BoxDecoration(
                                  color: COLOR_THEME_SHADOW_LIGHT,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 15,
                                margin: EdgeInsets.only(top: 5, right: 5),
                                decoration: BoxDecoration(
                                  color: COLOR_THEME_SHADOW_LIGHT,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
