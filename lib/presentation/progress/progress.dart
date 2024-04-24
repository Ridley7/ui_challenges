import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicators"),
      ),

      body: ProgressView(),
    );
  }
}

class ProgressView extends StatelessWidget {
  const ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text("Progress Indicator"),
          SizedBox(height: 30,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black54,),
          SizedBox(height: 30,),

          Text("Controlled progress indicator"),
          SizedBox(height: 30,),
          ControlledProgressIndicator()
        ],
      ),
    );
  }
}

class ControlledProgressIndicator extends StatelessWidget {
  const ControlledProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {

        final progressValue = snapshot.data;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 2,),
              const SizedBox(width: 20,),
              Expanded(
                  child: LinearProgressIndicator(value: progressValue,)
              )
            ],
          ),
        );
      }
    );
  }
}
