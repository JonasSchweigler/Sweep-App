import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

const String classicURL = 'assets/images/Sweep.png';

class DataBase {
  String imageUrl;
  String name;
  String adress;
  String provider;
  String imageURL;

  Future<void> userData(String userID) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = await auth.currentUser;
    final uid = await user.uid;
    userID = uid.toString();
    print(userID);
  }

  Future<void> uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;
    //Check Permission
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //selectImage
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);
      if (image != null) {
        //Upload to Firebase
        var snapshot = await _storage.ref().child('Image').putFile(file);

        var downloadURl = await snapshot.ref.getDownloadURL();
        imageUrl = downloadURl;
      } else {
        print('No path for image');
      }
    } else {
      print('Check your Permission');
    }
  }

  String getImageURL() {
    if (imageUrl == null) {
      imageUrl = classicURL;
    } else {
      imageURL = imageUrl;
    }
    return imageUrl;
  }

  Future<void> addProvider({
    String name,
    String adress,
    String provider,
    List product,
    String userID,
  }) async {
    Map<String, dynamic> products = {
      'productname': 'product',
    };

    FirebaseFirestore.instance.collection("Providers").add({
      'providerName': name,
      'providerType': provider,
      'adress': adress,
      'imageURL': classicURL,
      'products': products,
    });
  }

  void updateData() {}
}
