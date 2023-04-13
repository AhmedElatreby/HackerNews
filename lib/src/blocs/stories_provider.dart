import 'package:flutter/material.dart';
import 'stories_bloc.dart';
export 'stories_bloc.dart';
import 'package:news/src/blocs/stories_provider.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  StoriesProvider({required Key key, required Widget child})
      : bloc = StoriesBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(oldWidget) => true;

  static StoriesBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(aspect: StoriesProvider)
            as StoriesProvider)
        .bloc;
  }
}
