// import 'dart:io';
//
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:fruits_hub_dashboard/core/services/stoarage_service.dart';
// import 'package:path/path.dart' as b;
//
// class SupaBaseStorgeService implements StorageService {
//   static late Supabase _supabase;
//
//   static Future<void> createBuckets(String bucketName) async {
//     var buckets = await _supabase.client.storage.listBuckets();
//
//     bool isBucketExits = false;
//
//     for (var buckte in buckets) {
//       if (buckte.id == bucketName) {
//         isBucketExits = true;
//         break;
//       }
//     }
//     if (!isBucketExits) {
//       await _supabase.client.storage.createBucket(bucketName);
//     }
//   }
//
//   static Future<void> initSupabase() async {
//     _supabase = await Supabase.initialize(
//       url: kSupabaseUrl,
//       anonKey: kSupabaseKey,
//     );
//   }
//
//   @override
//   Future<String> uploadFile(File file, String path) async {
//     String fileName = b.basename(file.path);
//     String extensionName = b.extension(file.path);
//     var result = await _supabase.client.storage
//         .from('fruits_images')
//         .upload('$path/$fileName.$extensionName', file);
//
//     return result;
//   }
// }