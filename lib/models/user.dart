import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const User({
    required this.email,
    required this.username,
    required this.bio,
    required this.uid,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => { // converte informações do usuário para um objeto Json
    'email': email,
    'username': username,
    'bio': bio,
    'uid': uid,
    'photoUrl': photoUrl,
    'followers': followers,
    'following': following,
  };

  static User fromSnap(DocumentSnapshot snap) { // tiran um instantaneo do firebase e retornando em um objeto do tipo User
    var snapshot = snap.data() as Map<String, dynamic>; // converte o snapshot do usuário para um objeto Map
    return User (
      username: snapshot['username'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      photoUrl: snapshot['photoUrl'],
      bio: snapshot['bio'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}

