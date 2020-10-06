import 'package:flutter/material.dart';
import '../funds.dart';

class WalletHistory extends StatefulWidget {
  final Map currentUser;
  WalletHistory({Key key, this.currentUser}) : super(key: key);
  @override
  _WalletHistoryState createState() => _WalletHistoryState();
}

class _WalletHistoryState extends State<WalletHistory> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        reverse: true,
        itemCount: widget.currentUser['walletHistory'].length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 13),
            height: 76,
            padding: EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFdfdfe5),
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(8, 8))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 57,
                      width: 57,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF4185f4)),
                      child: Text(
                        (() {
                          if (widget.currentUser['walletHistory'][index]['type']
                                  .toString() ==
                              'Deposited') {
                            return "D";
                          } else {
                            return "W";
                          }
                        }()),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.currentUser['walletHistory'][index]['type'].toString()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${widget.currentUser['walletHistory'][index]['time'].toDate()}',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            color: Colors.grey[10],
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.currentUser['walletHistory'][index]['amount'].toString()}',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Color(0xFF0B3954),
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
