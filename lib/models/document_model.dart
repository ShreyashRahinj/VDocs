import 'dart:convert';

class DocumentModel {
  final String uid;
  final String title;
  final List content;
  final DateTime createdAt;
  final String id;

  DocumentModel({
    required this.uid,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.id,
  });

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      uid: map['uid'] ?? '',
      title: map['title'] ?? '',
      content: List.from(map['content']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      id: map['_id'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'content': content,
      'createdAt': createdAt.millisecondsSinceEpoch,
      '_id': id,
    };
  }

  DocumentModel copyWith({
    String? uid,
    String? title,
    List? content,
    DateTime? createdAt,
    String? id,
  }) {
    return DocumentModel(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentModel.fromJson(String source) =>
      DocumentModel.fromMap(json.decode(source));
}
