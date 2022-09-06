import 'package:arigram/model/emums/activity_enume.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xff1C1F2E),
              height: 65,
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontSize: 16, fontFamily: 'GB'),
                indicatorColor: Color(0xffF35383),
                indicatorWeight: 2,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 18),
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_getCustomScroll1(), _getCustomScroll1()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCustomScroll1() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 32, bottom: 5),
            child: Text(
              'New',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(((context, index) {
            return _getRow(ActivityStatus.followback, index);
          }), childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 32, bottom: 5),
            child: Text(
              'Today',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(((context, index) {
            return _getRow(ActivityStatus.likes, index);
          }), childCount: 3),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 32, bottom: 5),
            child: Text(
              'This Week',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(((context, index) {
            return _getRow(ActivityStatus.following, index);
          }), childCount: 5),
        ),
      ],
    );
  }

  Widget _getRow(ActivityStatus status, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xffF35383),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/${index + 4}.jpg'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'ArianForoutan',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Started Following',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'You',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '3 min',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          _getActionActivityRow(status)
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followback:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xffC5C5C5),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 2,
              color: Color(0xffC5C5C5),
            ),
          ),
        );

      case ActivityStatus.likes:
        return Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/item0.png'),
            ),
          ),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xffC5C5C5),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 2,
              color: Color(0xffC5C5C5),
            ),
          ),
        );
    }
  }
}
