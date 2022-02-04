import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postId;
  final String username;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.postId,
    required this.username,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,

  });

  Map<String, dynamic> toJson() => { // converte informações do usuário para um objeto Json
    'decription': description,
    'username': username,
    'postId': postId,
    'uid': uid,
    'postUrl': postUrl,
    'profImage': profImage,
    'likes': likes,
    'datePublished':datePublished,
  };

  static Post fromSnap(DocumentSnapshot snap) { // tiran um instantaneo do firebase e retornando em um objeto do tipo User
    var snapshot = snap.data() as Map<String, dynamic>; // converte o snapshot do usuário para um objeto Map
    return Post (
      username: snapshot['username'],
      uid: snapshot['uid'],
      postUrl: snapshot['postUrl'],
      datePublished: snapshot['datePublished'],
      description: snapshot['description'],
      likes: snapshot['likes'],
      profImage: snapshot['profImage'],
      postId: snapshot['postId'],
    );
  }
}