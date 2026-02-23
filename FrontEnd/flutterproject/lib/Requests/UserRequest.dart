import 'package:dio/dio.dart';
import 'package:flutterproject/Requests/auth_helper.dart';

class User {
  int? id;
    String? username;
    String? email;
    String? cpf;
    String? password;
    String? gender;
    int? income;
    int? expenses;
    int? balance;

    User({
      this.id,
      this.username,
      this.email,
      this.cpf,
      this.password,
      this.gender,
      this.income,
      this.expenses,
      this.balance
    });

    factory User.fromJson(Map<String, dynamic> json) {
      return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        cpf: json['cpf'],
        password: json['password'],
        gender: json['gender'],
        income: json['income'],
        expenses: json['expenses'],
        balance: json['balance']
      );
    }
}

class UserRequest {
    User? user;
    String? token;

    UserRequest({this.user, this.token});

    factory UserRequest.fromJson(Map<String, dynamic> json) {
      return UserRequest(
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        token: json['token']
      );
    }
}

class UserService {
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://localhost:5154/api'));

  Future<UserRequest?> register(String username, String email, String password) async {
    try {
      final response = await dio.post('/User/register', data: {
        'username': username,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        return UserRequest.fromJson(response.data);
      } else {
        print('Failed to register user: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during registration: $e');
      return null;
    }
  }

  Future<UserRequest?> login(String username, String password) async {
    try {
      final response = await dio.post('/User/login', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        return UserRequest.fromJson(response.data);
      } else {
        print('Failed to login user: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

  Future<User?> getUserDetails(String username) async {
    try {
      final headers = await authHeaders();
      final response = await dio.get('/User/$username', options: Options(
        headers: {
          'Authorization': headers['Authorization'] ?? '',
        },
      ));
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        print('Failed to fetch user details: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching user details: $e');
      return null;
    }
  }

  Future<bool> updateUser(int id, String username, String email) async {
    try {
      final headers = await authHeaders();
      final response = await dio.put('/User/$id', data: {
        'username': username,
        'email': email,
      }, options: Options(
        headers: {
          'Authorization': headers['Authorization'] ?? '',
        },
      ));

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to update user: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error updating user: $e');
      return false;
    }
  }

  Future<bool> deleteUser(int id) async {
    try {
      final headers = await authHeaders();
      final response = await dio.delete('/User/$id', options: Options(
        headers: {
          'Authorization': headers['Authorization'] ?? '',
        },
      ));
      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to delete user: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error deleting user: $e');
      return false;
    }
  }
}