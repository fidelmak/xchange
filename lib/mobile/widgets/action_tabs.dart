import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.rocket_launch_outlined,
                    color: Colors.green,
                  )),
              Text('Deposit')
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.credit_card, color: Colors.green)),
              Text('Withdraw')
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.attractions_outlined, color: Colors.green)),
              Text('IEO')
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.gavel_outlined, color: Colors.green)),
              Text('STAKING')
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.headset, color: Colors.green)),
              const Text('Chat')
            ],
          ),
        ],
      ),
    );
  }
}
