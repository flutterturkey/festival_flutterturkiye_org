import 'package:flutter/material.dart';

/// TODO(devs) Rewrite this entire page and make it fun
class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('ERROR!')),
        body: _colorList(context),
      );

  Widget _colorList(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            'ERROR: 404\n\n\nPAGE NOT FOUND!',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
      );
}
