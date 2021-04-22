import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/entry.dart';

class SuccessProvider with ChangeNotifier {
  List<Entry> _successList = [
//     Entry(
//       id: 's1',
//       title: 'first',
//       description: 'first Desc',
//       date: DateTime.now(),
//     ),
//     Entry(
//       id: 's2',
//       title: 'second',
//       description: 'second Desc',
//       date: DateTime.now(),
//     ),
//     Entry(
//       id: 's3',
//       title: 'Lorem wala text',
//       description:
//           '''Lorem ipsum dolor sit amet, ius no congue voluptatum accommodare, te nam inermis euripidis instructior. An ius dolor repudiandae. Mei nihil mollis petentium an, per te dolorem antiopam. Ex decore sanctus eos. Mentitum pertinax mea eu. Pro ridens utamur tincidunt et, an nam essent reformidans.

// Et accusamus posidonium qui, ne vix sint dolore. Etiam errem accumsan ne eum. Te usu discere electram quaerendum. Te pri dicam imperdiet democritum. Te ius vide neglegentur signiferumque, eum an vide vivendum, at eum quidam nostrum omittam.

// Vidit omittantur usu eu, qui dolore facilisi an. Graece volumus aliquando his te, graeci sensibus ei qui. Pro sententiae efficiantur cu, per te brute equidem, cu veri assentior prodesset mel. Et has paulo albucius periculis, facilis vituperata ex mel, vel primis civibus in. Nam dicta dolorum vituperatoribus no, quot autem postulant pri cu, has ut solum insolens. Soleat accusam epicuri qui ei, posse aperiam ornatus ex nam.

// His ex velit veniam tritani, sed atqui veniam conclusionemque cu, mea ex fabellas electram. Ei eum tractatos deseruisse dissentiet, idque nulla probatus ei mei. In magna aperiam prompta usu, ut usu audire dolorum efficiendi, sea nihil choro everti ei. Cu verear tritani accumsan per, erat decore pro ea. Te vis epicuri omnesque consequuntur, erant tractatos nec an, mentitum indoctum moderatius ea qui.

// In erat legendos vix, everti dolores perfecto vel cu. Cu tollit voluptatum omittantur usu, duo ut dicit saperet euripidis. Vivendo persecuti ea sit. Sea ei partem atomorum, vel nusquam principes consulatu te, minim ridens quodsi ex cum. Eros fuisset disputando no eos, te nemore urbanitas quo.''',
//       date: DateTime.now(),
//     ),
    // Entry(
    //   id: 's4',
    //   title: 'fourth',
    //   description: 'fourth Desc',
    //   date: DateTime.now(),
    // ),
    // Entry(
    //   id: 's5',
    //   title: 'fifth',
    //   description: 'fifth Desc',
    //   date: DateTime.now(),
    // ),
  ];

  List<Entry> get successList {
    return [..._successList];
  }

  Future<void> fetchEntries() async {
    const url =
        'https://events-5eddb-default-rtdb.firebaseio.com/success_entry.json';
    try {
      final response = await http.get(Uri.parse(url));
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      // call it as extractedData and instead of dynamic we can also use Object, but not a nested map,
      // even though we are getting a nested map, because dart doesn't understand that!
      final List<Entry> tempList = [];
      responseBody.forEach(
        (entryId, entryData) {
          tempList.add(
            Entry(
              id: entryId,
              title: entryData['title'],
              description: entryData['description'],
              date: DateTime.parse(entryData['date']),
            ),
          );
        },
      );
      _successList = tempList;
      notifyListeners();
      // print(json.decode(response.body));
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> addData({
    String id,
    String title,
    String description,
    DateTime date,
  }) async {
    const url =
        'https://events-5eddb-default-rtdb.firebaseio.com/success_entry.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'title': title,
            'description': description,
            'date': date.toString(),
          },
        ),
      );
      _successList.add(Entry(
        id: json.decode(response.body)['name'],
        title: title,
        description: description,
        date: date,
      ));
    } catch (error) {
      print('error : $error');
      throw error;
    }
    notifyListeners();
  }

  void delete(String id) {
    _successList.removeWhere(
      (entry) => entry.id == id,
    );
    notifyListeners();
  }

  Future<void> updateData({
    String id,
    String title,
    String description,
    DateTime date,
  }) async {
    final url =
        'https://events-5eddb-default-rtdb.firebaseio.com/success_entry/$id.json';
    print('id : $id');
    try {
      await http.patch(Uri.parse(url),
          body: json.encode({
            'title': title,
            'description': description,
            'date': date.toString(),
          }));
      final index = _successList.indexWhere(
        (entry) => entry.id == id,
      );
      _successList[index] = Entry(
        id: id,
        title: title,
        description: description,
        date: date,
      );
      notifyListeners();
    } catch (error) {
      print('$error : this error was thrown while trying to update');
      throw error;
    }
  }
}
