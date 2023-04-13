import 'package:flutter/material.dart';
import 'stories_bloc.dart';
export 'stories_bloc.dart';
import 'package:news/src/blocs/stories_provider.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  StoriesProvider({Key? key, required Widget child, required Center Function(dynamic context, dynamic bloc) builder})
      : bloc = StoriesBloc(),
        super(key: key ?? const ValueKey('StoriesProvider'), child: child);

  @override
  bool updateShouldNotify(oldWidget) => true;

  static StoriesBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(aspect: StoriesProvider)
            as StoriesProvider)
        .bloc;
  }
}
