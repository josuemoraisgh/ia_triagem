import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../interfaces/asssistido_remote_storage_interface.dart';
import '../services/provider_service.dart';

class AssistidoRemoteStorageRepository
    implements AssistidoRemoteStorageInterface {
  late final ProviderService provider;
  final String baseUrl = 'script.google.com';

  AssistidoRemoteStorageRepository({required provider}) {
    this.provider = provider ?? Modular.get<ProviderService>();
  }

  Future<dynamic> sendGet(
      {String table = "BDados",
      required String func,
      required String type,
      dynamic p1,
      dynamic p2,
      dynamic p3}) async {
    var response = await provider.get(baseUrl,
        bodyUrl:
            '/macros/s//exec',
        queryParameters: {
          "table": table,
          "func": func,
          "type": type,
          "p1": p1,
          "p2": p2,
          "p3": p3,
        });
    if (response != null) {
      if (response["status"] == "SUCCESS") {
        return response["items"];
      } else {
        debugPrint(
            "AssistidoRemoteStorageRepository - sendUrl - ${response["status"]}");
      }
    }
    return null;
  }

  @override
  Future<int?> addData(List<dynamic>? value, {String table = "BDados"}) async {
    if (value != null) {
      return (sendGet(table: table, func: 'add', type: 'data', p1: value)
          as Future<int?>);
    }
    return null;
  }

  @override
  Future<List<dynamic>?> getChanges({String table = "BDados"}) async {
    List<dynamic>? response =
        await sendGet(table: table, func: 'get', type: 'changes');
    return response;
    /*if (response != null) {
        if ((response as List).isNotEmpty) {
        return response.map((e) => Assistido.fromList(e)).toList();
      }
    }
    return null;*/
  }

  @override
  Future<List<dynamic>?> getRow(String rowId, {String table = "BDados"}) async {
    final List<dynamic> response =
        await sendGet(func: 'get', type: 'datas', p1: rowId);
    return response;
  }

  @override
  Future<String?> setData(String rowsId, List<dynamic> data,
      {String table = "BDados"}) async {
    final String? response = await sendGet(
        table: table, func: 'set', type: 'data', p1: rowsId, p2: data);
    return response;
  }

  @override
  Future<dynamic> deleteData(String row, {String table = "BDados"}) async {
    final response =
        await sendGet(table: table, func: 'del', type: 'data', p1: row);
    return response;
  }
}
