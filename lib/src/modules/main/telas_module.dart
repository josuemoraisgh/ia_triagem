import 'package:flutter_modular/flutter_modular.dart';
import 'telas_page.dart';

class TelasModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  List<Bind<Object>> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/",
        child: (_, args) =>
            TelasPage(startTime: DateTime.now(), id: args.data ?? 1)),
  ];
}
