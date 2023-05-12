import 'package:flutter/material.dart';
import 'package:flutter_application_5/widget/exercise_widget.dart';

import 'widget/line_chart_widget.dart';

class HomePage extends StatelessWidget {
  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
        leading: const Icon(Icons.menu),
        expandedHeight: MediaQuery.of(context).size.height * 0.5,
        stretch: true,
        pinned: true,
        flexibleSpace: const FlexibleSpaceBar(
          background: LineChartWidget(),
        ),
        centerTitle: true,
        title: const Text("Statistics"),
        actions: const [
          Icon(
            Icons.person,
            size: 28,
          ),
          SizedBox(
            width: 12,
          )
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          buildAppBar(context),
          ExercisesWidget(),
        ],
      ),
    );
  }
}
