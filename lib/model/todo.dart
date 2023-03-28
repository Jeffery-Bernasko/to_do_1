class ToDo{
  String? id;
  String? todoText;
  late bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
 });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'Checking Mail', isDone: false),
      ToDo(id: '02', todoText: 'Get Ready for work', isDone: false),
      ToDo(id: '03', todoText: 'Take Breakfast', isDone: false),
      ToDo(id: '04', todoText: 'Take Medication'),
      ToDo(id: '05', todoText: 'Start Work' ),
      ToDo(id: '06', todoText: 'Go for break'),
      ToDo(id: '07', todoText: 'Go home' ),
    ];
  }
}