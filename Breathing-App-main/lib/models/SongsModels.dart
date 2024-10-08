import 'package:cloud_firestore/cloud_firestore.dart';

class Song {
  final String title;  final String artist; 
  final String audioUrl; 
  final String imageUrl; 
  bool isFavorite; 

  Song({
    required this.title,
    required this.artist,
    required this.audioUrl,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory Song.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Song(
      title: data['title'] ?? '', 
      artist: data['artist'] ?? '', 
      audioUrl: data['audioUrl'] ?? '', 
      imageUrl: data['imageUrl'] ?? '', 
      isFavorite: data['isFav'] ?? false,
    );
  }
}
