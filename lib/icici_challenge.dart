import 'package:flutter/material.dart';

import 'package:icici_challenge/bottom_sheet_icon_model.dart';
import 'package:icici_challenge/card_model.dart';
import 'package:icici_challenge/custom/currencyFormat.dart';
class IciciChallenge extends StatefulWidget {
  @override
  _IciciChallengeState createState() => _IciciChallengeState();
}

class _IciciChallengeState extends State<IciciChallenge> {
  List<CardModel> cards;
  List a = new List(3);
  List<BottomSheetIconModel> bottomSheetIconModels = new List();
  int numToReduce = 0;
  var sumTextController, nextSumTextController;
  var balanceSumTextController, nextBalanceSumTextController;

  @override
  void initState() {
    super.initState();
    cards = getCardList();
    bottomSheetIconModels = getBottomSheetIconList();
  }

  getBottomSheetIconList() {
    List<BottomSheetIconModel> list = new List();
    list.add(BottomSheetIconModel(Icons.widgets, "name"));
    list.add(BottomSheetIconModel(Icons.four_k, "name"));
    list.add(BottomSheetIconModel(Icons.filter, "name"));
    list.add(BottomSheetIconModel(Icons.whatshot, "name"));
    list.add(BottomSheetIconModel(Icons.add_photo_alternate, "name"));
    list.add(BottomSheetIconModel(Icons.color_lens, "name"));
    list.add(BottomSheetIconModel(Icons.airline_seat_individual_suite, "name"));
    list.add(BottomSheetIconModel(Icons.beenhere, "name"));
    list.add(BottomSheetIconModel(Icons.camera, "name"));
    list.add(BottomSheetIconModel(Icons.equalizer, "name"));
    list.add(BottomSheetIconModel(Icons.data_usage, "name"));
    list.add(BottomSheetIconModel(Icons.gradient, "name"));
    list.add(BottomSheetIconModel(Icons.local_gas_station, "name"));
    return list;
  }

  getCardList() {
    List<CardModel> cards = List();
    cards.add(CardModel("Ashish Kumar", "Self", 1000000, 99986,
        "ILGIC/QBJ/00/000000011T", DateTime(2023, 6, 12), 1));
    cards.add(CardModel("Karishma A Kumar", "Wife", 10000000, 999986,
        "ILGIC/QBJ/00/000000009S", DateTime(2020, 6, 30), 2));
    cards.add(CardModel("Santosh A Kumar", "Son", 10000, 99860000000000,
        "ILGIC/QBJ/000000011T0/000000012K", DateTime(2021, 1, 5), 3));
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icici Challenge"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(height: 300, child: Stack(children: getCards())),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getSlider(index),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        child: new Icon(Icons.arrow_upward),
      ),
    );
  }

  Widget getSlider(int index) {
    Widget widget = ClipRRect(
        borderRadius: new BorderRadius.circular(16.0),
        child: Image.asset(
          "${getSliderImage(index)}",
          fit: BoxFit.fill,
          height: 300,
          width: MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width / 10,
        ));

    return widget;
  }

  String getSliderImage(int index) {
    switch (index) {
      case 0:
        return "images/banner1.jpg";
      case 1:
        return "images/banner2.jpg";
      case 2:
        return "images/banner3.jpg";
      default:
        return "images/banner1.jpg";
    }
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color.fromARGB(210, 2, 26, 70),
                  Color.fromARGB(225, 2, 26, 70),
                  Color.fromARGB(235, 2, 26, 70),
                  Color.fromARGB(255, 2, 26, 70),
                ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter)),
            child: GridView.count(
              crossAxisCount: 3,
              children: getBottomSheetIconWidgets(),
            ),
          );
        });
  }

  List<Widget> getBottomSheetIconWidgets() {
    List<Widget> bottomSheets = new List();
    for (int i = 0; i < bottomSheetIconModels.length; i++) {
      BottomSheetIconModel model = bottomSheetIconModels[i];

      Widget widget = Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 16, 59, 110),
            borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.all(28),
        child: Icon(
          model.icon,
          size: 32,
          color: Color.fromARGB(255, 116, 202, 243),
        ),
      );

      bottomSheets.add(widget);
    }
    return bottomSheets;
  }

  List<Widget> getCards() {
    List<Widget> widgets = new List();
    double k = 1;
    double height = 300;

    for (int i = 0; i < cards.length; i++) {
      int percentage = ((250 / 250)).toInt();
      CardModel cardModel = cards[i];
      CardModel nextCardModel = (i >= cards.length - 1) ? null : cards[i + 1];

      sumTextController = getCurrencyFormat(cardModel.sum);
      balanceSumTextController = getCurrencyFormat(cardModel.balanceSum);
      sumTextController.text = cardModel.sum.toString();
      balanceSumTextController.text = cardModel.balanceSum.toString();
      if (nextCardModel != null) {
        nextSumTextController = getCurrencyFormat(nextCardModel.sum);
        nextBalanceSumTextController =
            getCurrencyFormat(nextCardModel.balanceSum);
        nextSumTextController.text = nextCardModel.sum.toString();
        nextBalanceSumTextController.text = nextCardModel.balanceSum.toString();
      }

      Widget widget = Positioned(
        left: 10 * k++,
        top: 10 / k * 3.5,
        bottom: 10 / k * 3.5,
        child: Center(
          child: Draggable(
            maxSimultaneousDrags: 1,
            child: Container(
              decoration: BoxDecoration(
                  gradient: getBgGradientForCard(cardModel.type),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              height: (height * percentage).toDouble() -
                  (height * percentage).toDouble() / k / 2,
              width: MediaQuery.of(context).size.width -10 * k,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Chip(
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: (24 * percentage).toDouble()),
                        backgroundColor: Colors.white,
                        label: Text(
                          cardModel.title,
                          style: TextStyle(
                              color: getBgColorForCard(cardModel.type),
                              fontSize: (12 * percentage).toDouble(),
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: (16 * percentage).toDouble(),
                        vertical: (24 * percentage).toDouble()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: (16 * percentage).toDouble(),
                            ),
                            CircleAvatar(
                              backgroundColor:
                                  getBgColorForCard(cardModel.type),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${cardModel.name[0]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: (24 * percentage).toDouble(),
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                            SizedBox(width: (16 * percentage).toDouble()),
                            Text(
                              "${cardModel.name}",
                              style: TextStyle(
                                  fontSize: (20 * percentage).toDouble(),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: (4 * percentage).toDouble(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: (8 * percentage).toDouble(),
                                  horizontal: (4 * percentage).toDouble()),
                              decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.white),
                                    left: BorderSide(color: Colors.white),
                                    right: BorderSide(color: Colors.white),
                                    bottom: BorderSide(color: Colors.white),
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: (8 * percentage).toDouble(),
                                  ),
                                  Icon(
                                    Icons.ac_unit,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: (8 * percentage).toDouble(),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
//                                      mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        " Balance sum Insured",
                                        style: TextStyle(
                                            fontSize:
                                                (14 * percentage).toDouble(),
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white.withAlpha(230)),
                                      ),
                                      SizedBox(
                                        height: (4 * percentage).toDouble(),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            Icons.attach_money,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "${balanceSumTextController.text}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: (24 * percentage)
                                                    .toDouble()),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: (16 * percentage).toDouble(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: (16 * percentage).toDouble(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  " Sum Insured",
                                  style: TextStyle(
                                      fontSize: (14 * percentage).toDouble(),
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white.withAlpha(230)),
                                ),
                                SizedBox(
                                  height: (4 * percentage).toDouble(),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.attach_money,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "${sumTextController.text}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              (20 * percentage).toDouble()),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: (4 * percentage).toDouble(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: (16 * percentage).toDouble()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Card Number",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white.withAlpha(230)),
                                  ),
                                  Text(
                                    "${cardModel.cardNumber.toString().substring(0, (cardModel.cardNumber.toString().length ~/ 2))}\n${cardModel.cardNumber.toString().substring((cardModel.cardNumber.toString().length ~/ 2), cardModel.cardNumber.toString().length - 1)}",
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: (20 * percentage).toDouble(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "End Date",
                                  style: TextStyle(
                                      fontSize: (14 * percentage).toDouble(),
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white.withAlpha(230)),
                                ),
                                Text(
                                  "${getFormattedDate(cardModel.endDate)}",
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: (18 * percentage).toDouble(),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            feedback: Material(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                    gradient: getBgGradientForCard(cardModel.type),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                height: (height * percentage).toDouble() -
                    (height * percentage).toDouble() / k / 2,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Chip(
                          labelPadding: EdgeInsets.symmetric(
                              horizontal: (24 * percentage).toDouble()),
                          backgroundColor: Colors.white,
                          label: Text(
                            cardModel.title,
                            style: TextStyle(
                                color: getBgColorForCard(cardModel.type),
                                fontSize: (12 * percentage).toDouble(),
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: (16 * percentage).toDouble(),
                          vertical: (24 * percentage).toDouble()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: (16 * percentage).toDouble(),
                              ),
                              CircleAvatar(
                                backgroundColor:
                                    getBgColorForCard(cardModel.type),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${cardModel.name[0]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: (24 * percentage).toDouble(),
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                              SizedBox(width: (16 * percentage).toDouble()),
                              Text(
                                "${cardModel.name}",
                                style: TextStyle(
                                    fontSize: (20 * percentage).toDouble(),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: (4 * percentage).toDouble(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: (8 * percentage).toDouble(),
                                    horizontal: (4 * percentage).toDouble()),
                                decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(color: Colors.white),
                                      left: BorderSide(color: Colors.white),
                                      right: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white),
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: (8 * percentage).toDouble(),
                                    ),
                                    Icon(
                                      Icons.ac_unit,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: (8 * percentage).toDouble(),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
//                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          " Balance sum Insured",
                                          style: TextStyle(
                                              fontSize:
                                                  (14 * percentage).toDouble(),
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.white.withAlpha(230)),
                                        ),
                                        SizedBox(
                                          height: (4 * percentage).toDouble(),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons.attach_money,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "${balanceSumTextController.text}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: (24 * percentage)
                                                      .toDouble()),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: (16 * percentage).toDouble(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: (16 * percentage).toDouble(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    " Sum Insured",
                                    style: TextStyle(
                                        fontSize: (14 * percentage).toDouble(),
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white.withAlpha(230)),
                                  ),
                                  SizedBox(
                                    height: (4 * percentage).toDouble(),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.attach_money,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "${sumTextController.text}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                (20 * percentage).toDouble()),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: (4 * percentage).toDouble(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: (16 * percentage).toDouble()),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Card Number",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white.withAlpha(230)),
                                    ),
                                    Text(
                                      "${cardModel.cardNumber.toString().substring(0, (cardModel.cardNumber.toString().length ~/ 2))}\n${cardModel.cardNumber.toString().substring((cardModel.cardNumber.toString().length ~/ 2), cardModel.cardNumber.toString().length - 1)}",
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              (20 * percentage).toDouble(),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "End Date",
                                    style: TextStyle(
                                        fontSize: (14 * percentage).toDouble(),
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white.withAlpha(230)),
                                  ),
                                  Text(
                                    "${getFormattedDate(cardModel.endDate)}",
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: (18 * percentage).toDouble(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            onDragStarted: () {
              removeTop();
            },
            onDragEnd: (v) {
//              addRemoved();
            },
            onDraggableCanceled: (V, O) {
              addRemoved(cardModel);
            },
          ),
        ),
      );

      widgets.add(widget);
    }
    return widgets;
  }

  getBgColorForCard(int type) {
    switch (type) {
      case 1:
        return Color.fromARGB(255, 176, 58, 46);
      case 2:
        return Color.fromARGB(255, 27, 79, 114);
      case 3:
        return Color.fromARGB(255, 176, 58, 46);
      default:
        return Color.fromARGB(255, 27, 79, 114);
    }
  }

  getBgGradientForCard(int type) {
    switch (type) {
      case 1:
        return LinearGradient(colors: [
          Colors.orange,
          Color.fromARGB(255, 231, 76, 60),
          Color.fromARGB(255, 231, 76, 60),
          Color.fromARGB(255, 176, 58, 46)
        ], begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight);
      case 2:
        return LinearGradient(colors: [
          Color.fromARGB(255, 133, 193, 233),
          Colors.lightBlue,
          Colors.blueAccent,
          Colors.blue
        ], begin: FractionalOffset.bottomLeft, end: FractionalOffset.topRight);
      case 3:
        return LinearGradient(colors: [
          Colors.red,
          Colors.redAccent,
          Colors.deepOrange,
          Colors.deepOrangeAccent,
          Colors.orange
        ], begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight);
      default:
        return LinearGradient(
            colors: [Colors.blueGrey, Colors.blue],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight);
        ;
    }
  }

  getCurrencyFormat(int num) {
    var formatController;
    if (num > 999999999) {
      formatController = new MaskedTextController(mask: '00,00,00,000');
    } else if (num > 99999999) {
      formatController = new MaskedTextController(mask: '00,00,000');
    } else if (num > 999999) {
      formatController = new MaskedTextController(mask: '00,00,000');
    } else if (num > 9999) {
      formatController = new MaskedTextController(mask: '00,000');
    } else
      formatController = new MaskedTextController(mask: '0000');
    return formatController;
  }

  CardModel removedCard;

  void removeTop() {
    if (removedCard == null) removedCard = cards[cards.length - 1];
    List<CardModel> newCards = new List();
    for (int i = 0; i < cards.length - 1; i++) {
      newCards.add(cards[i]);
    }
    setState(() {
      cards = newCards;
    });
  }

  addPrevios() {
    List<CardModel> newCards = new List();
    for (int i = 0; i < cards.length; i++) {
      newCards.add(cards[i]);
    }
    if (removedCard != null) newCards.add(removedCard);
    setState(() {
      cards = newCards;
    });
  }

  String getFormattedDate(DateTime date) {
    int day = date.day;
    int month = date.month;
    int year = date.year;
    return "$day-${getShortMonth(month)}-$year";
  }

  String getShortMonth(int month) {
    switch (month) {
      case 1:
        return "JAN";
      case 2:
        return "FEB";
      case 3:
        return "MAR";
      case 4:
        return "APR";
      case 5:
        return "MAY";
      case 6:
        return "JUN";
      case 7:
        return "JUL";
      case 8:
        return "AUG";
      case 9:
        return "SEP";
      case 10:
        return "OCT";
      case 11:
        return "NOV";
      case 12:
        return "DEC";
      default:
        return "";
    }
  }

  void addRemoved(CardModel cardModel) {
    if (removedCard.cardNumber != cardModel.cardNumber) return;
    List<CardModel> newCards = new List();
    if (removedCard != null) newCards.add(removedCard);
    for (int i = 0; i < cards.length; i++) {
      newCards.add(cards[i]);
    }
    setState(() {
      cards = newCards;
    });
    removedCard = null;
  }
}
