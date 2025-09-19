// models/task_model.dart
class MediaItem {
  final String id;
  final String mediaType;
  final String fileUrl;
  final double lat;
  final double lng;
  final DateTime timestamp;
  final bool isProof;

  MediaItem({
    required this.id,
    required this.mediaType,
    required this.fileUrl,
    required this.lat,
    required this.lng,
    required this.timestamp,
    required this.isProof,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      id: json['_id'],
      mediaType: json['media_type'],
      fileUrl: json['file_url'],
      lat: json['geotag']['lat'],
      lng: json['geotag']['lng'],
      timestamp: DateTime.parse(json['timestamp']),
      isProof: json['is_proof'],
    );
  }
}

class Note {
  final String id;
  final String addedBy;
  final String noteText;
  final DateTime createdAt;

  Note({
    required this.id,
    required this.addedBy,
    required this.noteText,
    required this.createdAt,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['_id'],
      addedBy: json['added_by'],
      noteText: json['note_text'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

class TrackingItem {
  final String id;
  final String supervisorId;
  final String action;
  final DateTime timestamp;
  final double lat;
  final double lng;

  TrackingItem({
    required this.id,
    required this.supervisorId,
    required this.action,
    required this.timestamp,
    required this.lat,
    required this.lng,
  });

  factory TrackingItem.fromJson(Map<String, dynamic> json) {
    return TrackingItem(
      id: json['_id'],
      supervisorId: json['supervisor_id'],
      action: json['action'],
      timestamp: DateTime.parse(json['timestamp']),
      lat: json['auto_geotag']['lat'],
      lng: json['auto_geotag']['lng'],
    );
  }
}

class Task {
  final String id;
  final String title;
  final String description;
  final String priority;
  final String status;
  final DateTime slaDeadline;
  final double lat;
  final double lng;
  final String address;
  final String createdBy;
  final String assignedTo;
  final List<MediaItem> media;
  final List<Note> notes;
  final List<TrackingItem> tracking;
  final DateTime createdAt;
  final DateTime updatedAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.slaDeadline,
    required this.lat,
    required this.lng,
    required this.address,
    required this.createdBy,
    required this.assignedTo,
    required this.media,
    required this.notes,
    required this.tracking,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      priority: json['priority'],
      status: json['status'],
      slaDeadline: DateTime.parse(json['sla_deadline']),
      lat: json['location']['lat'],
      lng: json['location']['lng'],
      address: json['location']['address'],
      createdBy: json['created_by'],
      assignedTo: json['assigned_to'],
      media: (json['media'] as List).map((e) => MediaItem.fromJson(e)).toList(),
      notes: (json['notes'] as List).map((e) => Note.fromJson(e)).toList(),
      tracking:
          (json['tracking'] as List)
              .map((e) => TrackingItem.fromJson(e))
              .toList(),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
