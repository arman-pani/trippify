import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/utils/app_router.dart';
import 'package:trippify/utils/shared_prefs_methods.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  final double expandedHeight = 230.0;
  final double collapsedHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: expandedHeight,
            collapsedHeight: collapsedHeight,
            floating: true,
            pinned: true,
            snap: false,
            backgroundColor: ColorsConstants.lightBlueColor,
            surfaceTintColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: () =>
                      context.pushNamed(AppRouterConstants.editProfile),
                  icon: Icon(Icons.edit_rounded)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings_rounded)),
            ],
            flexibleSpace: FutureBuilder(
                future: SharedPrefsMethods.getUserInfo(),
                builder: (context, asyncSnapshot) {
                  return LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    final isCollapsed = constraints.maxHeight <=
                        collapsedHeight + kToolbarHeight;

                    return FlexibleSpaceBar(
                      centerTitle: isCollapsed ? false : true,
                      collapseMode: CollapseMode.pin,
                      expandedTitleScale: 1,
                      background: Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: ColorsConstants.blueColor,
                            backgroundImage: NetworkImage(
                                "https://picsum.photos/id/16/200/300"),
                          ),
                        ],
                      ),
                      titlePadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      title: isCollapsed
                          ? Row(
                              spacing: 10,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: ColorsConstants.blueColor,
                                  backgroundImage: NetworkImage(
                                      "https://picsum.photos/id/16/200/300"),
                                ),
                                Text(asyncSnapshot.data!.username,
                                    style: TextstyleConstants.titleTextStyle3),
                              ],
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 5,
                              children: [
                                Text(
                                  asyncSnapshot.data!.username,
                                  style: TextstyleConstants.titleTextStyle3,
                                ),
                                if (asyncSnapshot.data!.bio != null)
                                  Text(
                                    asyncSnapshot.data!.bio!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              ],
                            ),
                    );
                  });
                }),
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              TabBar(
                padding: EdgeInsets.all(0),
                indicatorColor: ColorsConstants.blueColor,
                labelColor: ColorsConstants.blueColor,
                controller: tabController,
                tabs: [
                  Tab(
                    text: 'Posts',
                  ),
                  Tab(
                    text: 'Comments',
                  ),
                  Tab(
                    text: 'Upvotes',
                  )
                ],
              ),
            ),
            pinned: true,
          ),
        ];
      },
      body: TabBarView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: tabController,
        children: [
          ListView.separated(
            itemCount: 20,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
          ),
          Text('Comments'),
          Text('Likes')
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: ColorsConstants.lightBlueColor, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
