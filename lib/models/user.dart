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
}
