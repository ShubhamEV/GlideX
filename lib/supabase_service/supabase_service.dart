import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:typed_data';

class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;

  // Database Operations
  
  // Insert data into a table
  static Future<void> insertData(String tableName, Map<String, dynamic> data) async {
    await client.from(tableName).insert(data);
  }

  // Update data in a table
  static Future<void> updateData(
    String tableName,
    Map<String, dynamic> data,
    String columnName,
    dynamic value,
  ) async {
    await client.from(tableName).update(data).eq(columnName, value);
  }

  // Delete data from a table
  static Future<void> deleteData(
    String tableName,
    String columnName,
    dynamic value,
  ) async {
    await client.from(tableName).delete().eq(columnName, value);
  }

  // Fetch data from a table
  static Future<List<Map<String, dynamic>>> fetchData(String tableName) async {
    final response = await client.from(tableName).select();
    return List<Map<String, dynamic>>.from(response);
  }

  // Fetch data with filters
  static Future<List<Map<String, dynamic>>> fetchDataWithFilter(
    String tableName,
    String column,
    dynamic value,
  ) async {
    final response = await client.from(tableName).select().eq(column, value);
    return List<Map<String, dynamic>>.from(response);
  }

  // Authentication Operations

  // Sign up with email and password
  static Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
  }) async {
    final response = await client.auth.signUp(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception('Sign up failed: No user returned');
    }

    return {
      'id': response.user!.id,
      'email': response.user!.email,
      'created_at': response.user!.createdAt,
    };
  }

  // Sign in with email and password
  static Future<Map<String, dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    final response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception('Sign in failed: No user returned');
    }

    return {
      'id': response.user!.id,
      'email': response.user!.email,
      'last_sign_in_at': response.user!.lastSignInAt,
    };
  }

  // Sign out
  static Future<void> signOut() async {
    await client.auth.signOut();
  }

  // Send OTP to email
  static Future<void> sendOtp({required String email}) async {
    await client.auth.signInWithOtp(email: email);
  }

  // Verify OTP
  static Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String token,
  }) async {
    final response = await client.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.email,
    );

    if (response.session == null || response.user == null) {
      throw Exception('OTP verification failed');
    }

    return {
      'id': response.user!.id,
      'email': response.user!.email,
      'email_confirmed_at': response.user!.emailConfirmedAt,
    };
  }

  // Get current user
  static User? getCurrentUser() {
    return client.auth.currentUser;
  }

  // Check if user is signed in
  static bool isSignedIn() {
    return client.auth.currentUser != null;
  }

  // Storage Operations

  // Upload file to storage
  static Future<String> uploadFile({
    required String bucketName,
    required String filePath,
    required Uint8List fileBytes,
  }) async {
    await client.storage.from(bucketName).uploadBinary(
          filePath,
          fileBytes,
        );

    return client.storage.from(bucketName).getPublicUrl(filePath);
  }

  // Download file from storage
  static Future<List<int>> downloadFile({
    required String bucketName,
    required String filePath,
  }) async {
    return await client.storage.from(bucketName).download(filePath);
  }

  // Delete file from storage
  static Future<void> deleteFile({
    required String bucketName,
    required String filePath,
  }) async {
    await client.storage.from(bucketName).remove([filePath]);
  }

  // Get public URL for a file
  static String getPublicUrl({
    required String bucketName,
    required String filePath,
  }) {
    return client.storage.from(bucketName).getPublicUrl(filePath);
  }
}
