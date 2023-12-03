import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Page1 extends StatelessWidget{
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(
                    Icons.local_taxi,
                    size: 40,
                ),
                Text('택시'),
              ],
            ),
            Column(
              children: [
                Icon(
                    Icons.local_taxi,
                    size: 40,
                ),
                Text('블랙')
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text('바이크')
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text('대리')
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                print('클릭');
              },
            ),
            Column(
              children: [
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text('택시')
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text('블랙')
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text('바이크')
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text('대리')
              ],
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildMiddle(){
    final imageItems = [
      'assets/page1.jpg',
      'assets/page2.jpg',
      'assets/page3.jpg',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
      ),
      items: imageItems.map((path)
    {
      return Builder(
        builder: (BuildContext context) {
          return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          child: ClipRect(
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            ),
    ),
        );
    },
    );
    }
    ).toList(),
    );
  }
  Widget _buildBottom(){
    final items = List.generate(
      10, (i){
        return ListTile(
          leading: Icon(Icons.notificaitons_none),
          title: Text('공지사항'),
        );
    });
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
    );
  }
}
