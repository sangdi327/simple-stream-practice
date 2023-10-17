import 'package:flutter/material.dart';

class NumberStream extends StatefulWidget {
  const NumberStream({super.key});

  @override
  State<NumberStream> createState() => _NumberStreamState();
}

class _NumberStreamState extends State<NumberStream> {
  Stream<int> countStream =
      Stream<int>.periodic(const Duration(milliseconds: 1000), (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: StreamBuilder<int>(
          stream: countStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text(
                'Error is occurred!',
                style: TextStyle(fontSize: 50),
              );
            } else if (snapshot.hasData) {
              return Text(
                '${snapshot.data}',
                style: const TextStyle(fontSize: 80),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )),
    );
  }
}
