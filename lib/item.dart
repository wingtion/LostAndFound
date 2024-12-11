import 'dart:io';

class Item{
  String _itemName;
  String _description;
  String _status;
  String _date;
  File? _image;

  Item(this._itemName , this._description , this._status , this._date);

  File? getImage(){
    return _image;
  }

  void setImage(File image) {
    _image = image;
  }

  String getDate(){
    return _date;
  }

  void setDate(String date) {
    _date = date;
  }

  String getStatus(){
    return _status;
  }

  void setStatus(String status) {
    _status = status;
  }

  String getDescription(){
    return _description;
  }

  void setDescription(String description) {
    _description = description;
  }

  String getItemName(){
    return _itemName;
  }

  void setItemName(String itemName) {
    _itemName = itemName;
  }
}