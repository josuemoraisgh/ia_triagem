import 'package:flutter_modular/flutter_modular.dart';
import '../interfaces/asssistido_remote_storage_interface.dart';
import '../services/provider_service.dart';
import '../repositories/assistido_gsheet_repository.dart';
import 'telas_page.dart';

class TelasModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  List<Bind<Object>> get binds => [
            Bind.lazySingleton<ProviderService>((i) => ProviderService()),
        Bind.lazySingleton<AssistidoRemoteStorageInterface>((i) =>
            AssistidoRemoteStorageRepository(provider: i<ProviderService>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/",
        child: (_, args) =>
            TelasPage(id: args.data ?? 6, answer: const {})),
  ];
}
