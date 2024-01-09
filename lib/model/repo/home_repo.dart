import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvesthub_agro/model/response/item_model.dart';
import 'package:harvesthub_agro/src/data/datasource/remote/http_client.dart';
import 'package:harvesthub_agro/src/utils/constants/m_images.dart';

class HomeRequest {
  final ApiClient apiSource;
  HomeRequest({required this.apiSource});


  Future<Response> getItemList() async {
    try {
      List<ItemModel> itemList = [
        ItemModel(id: 0, name: "ask_anything", image: MyImage.askAnything, bgColor: const Color(0xFFDE7AA1), itemColor: const Color(0xFFD55687)),
        ItemModel(id: 1, name: "translate_anything", image: MyImage.gTranslate, bgColor: const Color(0xFF6986D4), itemColor: const Color(0xFF4366C5)),
        ItemModel(id: 2, name: "personal_note", image: MyImage.note,  bgColor: const Color(0xFF5CC7A4), itemColor: const Color(0xFF32A981)),
        ItemModel(id: 3, name: "social_media", image: MyImage.share,  bgColor: const Color(0xFF61A3D0), itemColor: const Color(0xFF3985B6)),
        ItemModel(id: 4, name: "email_maker", image: MyImage.emailMaker,  bgColor: const Color(0xFFA983F0), itemColor: const Color(0xFF9365E7)),
        ItemModel(id: 5, name: "personal_advice", image: MyImage.advice,  bgColor: const Color(0xFFBD9187), itemColor: const Color(0xFFA97465)),
        ItemModel(id: 6, name: "password_generator", image: MyImage.key,  bgColor: const Color(0xFFBD9187), itemColor: const Color(0xFFA97465)),
        ItemModel(id: 7, name: "script_specialist", image: MyImage.editPen,  bgColor: const Color(0xFFBD9187), itemColor: const Color(0xFFA97465)),
        ItemModel(id: 8, name: "code_generate", image: MyImage.codeGenerate,  bgColor: const Color(0xFFBD9187), itemColor: const Color(0xFFA97465)),
      ];
      Response response = Response(body: itemList, statusCode: 200);
      return response;
    } catch (e) {
      return const Response(statusCode: 404, statusText: 'Item data not found');
    }
  }
}
