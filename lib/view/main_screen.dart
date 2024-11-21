import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(
        Icons.arrow_back_ios,
        color: Colors.grey,
      ),
    ),
    body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          'assets/background.png',
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Выберите подписку',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 40),
                _buildSubscriptionOption('1 месяц', '1000Р', description: 'Описание'),
                SizedBox(height: 30),
                _buildSubscriptionOption(
                  '6 месяцев',
                  '10000Р',
                  description: 'Описание',
                  originalPrice: '12000Р',
                  isHighlighted: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        'Купить',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFooterText('Terms of Use'),
                    _buildFooterText('Privacy Policy'),
                    _buildFooterButton('Restore Purchase'),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSubscriptionOption(String title, String price,
    {String? description, String? originalPrice, bool isHighlighted = false}) {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: isHighlighted ? Colors.black.withOpacity(0.7) : Colors.grey.withOpacity(0.4),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isHighlighted
                ? CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.check, color: Colors.white),
                  )
                : Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.7),
                        width: 2,
                      ),
                      color: Colors.transparent,
                    ),
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
                if (description != null) ...[
                  SizedBox(height: 4),
                  Text(description, style: TextStyle(color: Colors.white70)),
                ]
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price, style: TextStyle(color: Colors.white, fontSize: 20)),
                if (originalPrice != null)
                  Text(
                    originalPrice,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),
          ],
        ),
        if (isHighlighted)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Выгодно',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}


Widget _buildFooterText(String text) {
  return Text(
    text,
    style: TextStyle(color: Colors.white70, fontSize: 14),
  );
}

Widget _buildFooterButton(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.transparent,
      border: Border.all(
        color: Colors.purple.withOpacity(0.5),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: TextStyle(color: Colors.white70, fontSize: 14),
    ),
  );
}

}
