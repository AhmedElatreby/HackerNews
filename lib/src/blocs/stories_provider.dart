import 'package:flutter/material.dart';

import 'stories_bloc.dart';
export 'stories_bloc.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  StoriesProvider({required Key key, required Widget child, required Center Function(dynamic context, dynamic bloc) builder})
      : bloc = StoriesBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static StoriesBloc? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<StoriesProvider>())
        ?.bloc;
  }
}