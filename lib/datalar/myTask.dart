class Task {
  //Instance variable
  late String taskName;
  late bool taskStatus;

  //Constructor
  Task({required this.taskName, required this.taskStatus});
  //Instance method
  //Degiskeni degistiren method
  changeStatus() {
    taskStatus = !taskStatus;
  }

  // Mapa ceviren method
  Map toMap() {
    return {"taskName": this.taskName, "taskStatus": this.taskStatus};
  }
// Mapi objeye ceviren COnstructor
Task.FromMapToObject(Map map){
 this.taskName= map["taskName"];
 this.taskStatus=map["taskStatus"];
}
}
