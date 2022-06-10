class InputModel {
  String input;
  String result;
  String date;

  InputModel({
    this.input,
    this.result,
    this.date,
  });

//
  Map<String, dynamic> toJson() => {
        input: "input",
        result: "result",
        date: "date",
      };

//
  fromJson(Map<String, dynamic> json) {
    input = json["input"];
    result = json['result'];
    date = json['date'];
  }
}
