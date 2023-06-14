import '../../../../index.dart';

import 'dart:math' as math;

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  PageController? _pageController;

  int _initialPage = 0;

  // DayFunctions d = DayFunctions();

  // List<RoutineTasksGroupByDate> _dayList = [];

  final List<DateTime> _currentWeek = [];

  // void _groupByTasks() {
  //   _dayList = [];
  //   for (var i in _currentWeek) {
  //     List<Task> tempTaskList = [];
  //     for (var j in widget.routine.taskList) {
  //       if (i.day == j.date.day &&
  //           i.month == j.date.month &&
  //           i.year == j.date.year) {
  //         tempTaskList.add(j);
  //       }
  //     }
  //     _dayList.add(
  //       RoutineTasksGroupByDate(
  //         routineID: widget.routine.id,
  //         taskList: tempTaskList,
  //         date: i,
  //       ),
  //     );
  //   }
  // }

  // void _setCurrentWeek() {
  //   if (widget.routine != null) {
  //     _currentWeek = d.currentWeek();
  //     _groupByTasks();
  //   }
  // }

  void _setInitialPage() {
    DateTime now = DateTime.now();
    int count = 0;
    for (var i in _currentWeek) {
      if (i.day == now.day && i.month == now.month && i.year == now.year) {
        setState(() {
          _initialPage = count;
        });
        return;
      }
      count++;
    }
    setState(() {
      _initialPage = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    // _setCurrentWeek();
    _setInitialPage();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: _initialPage,
    );
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _setCurrentWeek();
    // return widget.routine == null
    //     ? const Center(
    //         child: CircularProgressIndicator(),
    //       )
    return AspectRatio(
      aspectRatio: 0.85,
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            _initialPage = value;
          });
        },
        physics: const ClampingScrollPhysics(),
        controller: _pageController,
        // itemCount: _dayList.length,
        itemCount: 7,
        itemBuilder: (context, index) {
          return buildSlider(index);
        },
      ),
    );
  }

  Widget buildSlider(int index) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (context, child) {
        double value = 0;
        if (_pageController!.position.haveDimensions) {
          value = index - _pageController!.page!;
          value = (value * 0.038).clamp(-1, 1);
        }
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 350),
          opacity: _initialPage == index ? 1 : 0.4,
          child: Transform.rotate(
            angle: math.pi * value,
            child: GestureDetector(
              onTap: () => Get.to(
                const TasksScreen(),
              ),
              // onTap: () {
              //   Map<String, dynamic> arguments = {
              //     "routine": widget.routine,
              //     "current_date": _dayList[index].date,
              //   };
              //   Navigator.of(context)
              //       .pushNamed(DetailScreen.routeName, arguments: arguments);
              // },
              child: const CardItem(),
            ),
          ),
        );
      },
    );
  }
}
