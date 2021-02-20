class Myaccount {
  String message;
  String mId;
  String mName;
  String mImage;
  String mQuantity;
  String mPay;
  String mDate;

  Myaccount(
      {this.message,
        this.mId,
        this.mName,
        this.mImage,
        this.mQuantity,
        this.mPay,
        this.mDate});

  Myaccount.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    mId = json['mId'];
    mName = json['mName'];
    mImage = json['mImage'];
    mQuantity = json['mQuantity'];
    mPay = json['mPay'];
    mDate = json['mDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['mId'] = this.mId;
    data['mName'] = this.mName;
    data['mImage'] = this.mImage;
    data['mQuantity'] = this.mQuantity;
    data['mPay'] = this.mPay;
    data['mDate'] = this.mDate;
    return data;
  }
}