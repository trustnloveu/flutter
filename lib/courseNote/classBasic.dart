

class Person {
  String name;
  int age;
  
//   Person(String inputName, int inputAge) {
// //     this.name = name;
// //     this.age = age;
//     name = inputName;
//     age = inputAge;
//   }
  
//    Person({String inputName, int age}) {
//     name = inputName;
//     this.age = age;
//   }
  
   Person({this.name, this.age}) {}

   Person.veryOld(this.name) {
     age = 60;
   }
}


void main() {
//   var person = Person("Austin", 29);
//   person.age = 10;
  
//   print(person.name);
//   print(person.age);
  
//   var student = Person(inputName: "Anonymous", age: 20);

//   print(student.name);
//   print(student.age);
  
  var teacher = Person(name: "Lilly", age: 27);

  print(teacher.name);
  print(teacher.age);

  var eldery = Person.veryOld("Grand Father");

  print(eldery.name);
  print(eldery.age);
}

