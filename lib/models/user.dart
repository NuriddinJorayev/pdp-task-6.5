class User {
  int id;
  String name;
  String salary;
  String age;
  int userid;

  User(this.id, this.name, this.salary, this.age, this.userid);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['employee_name'],
        salary = json['employee_salary'],
        age = json['employee_age'],
        userid = json['profile_image'];

  Map<String, dynamic> toJson() =>{
    'id' : id,
    'employee_name' : name,
    'employee_salary' : salary,
    'employee_age' : age,
    'profile_image' : userid,
  }  ;    
}
