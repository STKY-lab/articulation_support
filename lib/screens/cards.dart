import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cards extends StatefulWidget {
  static const routeName = '/cards';
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List<CardModel> cardList = [
    CardModel(title: 'お茶', speakText: 'お茶が飲みたい'),
    CardModel(title: '水', speakText: '水が飲みたい'),
    CardModel(title: '酒', speakText: '酒が飲みたい'),
  ];

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SlideCardTest'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            return Slidable(
              key: UniqueKey(),
              startActionPane: ActionPane(
                extentRatio: 0.3,
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {},
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    icon: Icons.favorite_border,
                    label: 'favorite',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                extentRatio: 0.5,
                motion: const StretchMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () {
                    setState(() => cardList.removeAt(index));
                  },
                ),
                children: [
                  SlidableAction(
                    onPressed: (_) {},
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'edit',
                  ),
                  SlidableAction(
                    onPressed: (_) {
                      setState(() => cardList.removeAt(index));
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'delete',
                  ),
                ],
              ),
              child: SizedBox(
                height: deviceHeight * 0.1,
                width: deviceWidth,
                child: Card(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      cardList[index].title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cardList.add(
              CardModel(title: '追加分', speakText: ''),
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CardModel {
  final String title;
  final String speakText;

  CardModel({required this.title, required this.speakText});
}
