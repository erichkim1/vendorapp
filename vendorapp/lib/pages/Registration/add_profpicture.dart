import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProfPicture extends StatefulWidget {
  @override
  _AddProfPicture createState() => _AddProfPicture();
}

class _AddProfPicture extends State<AddProfPicture> {
  PickedFile _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            //width: 3.0,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 640.0,
                  minHeight: 220.0,
                  maxHeight: 320,
                ),
                child: _getImage(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text('Add Profile Image'),
                        color: Colors.grey[200],
                        textColor: Colors.black,
                        onPressed: () {
                          _getImageFromDevice(ImageSource.gallery);
                        },
                      )),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text('Continue'),
                      color: Colors.blue[400],
                      highlightColor: Colors.blue[600],
                      textColor: Colors.white,
                      /*
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => DogSize(),
                              ))))
                              */
                    ),
                  )
                  /*   RaisedButton(
                    child: Text('Next Page'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.redAccent,
                    onPressed: () => Navigator.pushNamed(
                      context, '/dog_size')
                  ) */
                ],
              )
            ]),
      ),
    );
  }

  Widget _getImage() {
    if (_imageFile?.path == null) {
      return Image.asset('lib/Logos/upload_profpic.jpg');
    } else {
      return Image.file(File(_imageFile.path));
    }
  }

  Future _getImageFromDevice(ImageSource source) async {
    final picker = ImagePicker();
    var pFile = await picker.getImage(source: source);
    if (pFile == null) {
      return;
    }
    setState(() {
      this._imageFile = pFile;
    });
  }
}
