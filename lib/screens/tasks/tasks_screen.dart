import '../../index.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  final int _activeIndex = 0;

  void _setTabBar() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: _activeIndex,
    );
  }

  @override
  void initState() {
    super.initState();
    _setTabBar();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textBuilder(
                      "Monday",
                      textType: TextType.header_1,
                      color: Theme.of(context).hintColor,
                    ),
                    CustomAppIcon(
                      icon: Icons.add,
                      onPressed: () {},
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 32,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TabBar(
                labelPadding: const EdgeInsets.only(bottom: 4),
                controller: _tabController,
                indicatorColor: Theme.of(context).hintColor,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  textBuilder(
                    "ONGOING",
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w700,
                  ),
                  textBuilder(
                    "PENDING",
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w700,
                  ),
                  textBuilder(
                    "COMPLETED",
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: SizeConfig.screenHeight! * 0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: topBorderRadius,
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
