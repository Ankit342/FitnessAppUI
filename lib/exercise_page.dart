import 'package:flutter/material.dart';
import 'package:flutter_application_5/model/exercise_set.dart';
import 'package:flutter_application_5/widget/video_control_widget.dart';

import 'model/exercise.dart';
import 'widget/video_player_widget.dart';

class ExercisePage extends StatefulWidget {
  final ExerciseSet exerciseSet;
  const ExercisePage({super.key, required this.exerciseSet});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final controller = PageController();
  late Exercise currentExercise;
  @override
  void initState() {
    currentExercise = widget.exerciseSet.exercises.first;
    super.initState();
  }

  Widget buildVideoControls() => VideoControlsWidget(
      exercise: currentExercise,
      onRewindVideo: () => controller.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn),
      onNextVideo: () => controller.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn),
      onTogglePlaying: (isPlaying) {
        setState(() {
          if (isPlaying)
            currentExercise.controller?.play();
          else
            currentExercise.controller?.pause();
        });
      });
  Widget buildVideos() => PageView(
        controller: controller,
        onPageChanged: (index) => setState(() {
          currentExercise = widget.exerciseSet.exercises[index];
        }),
        children: widget.exerciseSet.exercises
            .map((exercise) => VideoPlayerWidget(
                  exercise: exercise,
                  onInitialized: () => setState(() {}),
                ))
            .toList(),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(currentExercise.name),
        centerTitle: true,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        buildVideos(),
        Positioned(bottom: 20, left: 50, right: 50, child: buildVideoControls())
      ]),
    );
  }
}
