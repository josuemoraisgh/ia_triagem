import 'package:flutter_modular/flutter_modular.dart';
import 'package:ia_triagem/src/modules/home/telas_controller.dart';
import '../interfaces/asssistido_remote_storage_interface.dart';
import '../services/provider_service.dart';
import '../repositories/assistido_gsheet_repository.dart';
import 'telas_page.dart';

class TelasModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<TelasController>((i) => TelasController()),
        Bind.lazySingleton<ProviderService>((i) => ProviderService()),
        Bind.lazySingleton<AssistidoRemoteStorageInterface>((i) =>
            AssistidoRemoteStorageRepository(provider: i<ProviderService>())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => TelasPage(id: args.data ?? 61)),
  ];
}
