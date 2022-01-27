class strings {
  List<messageModel> listOfMessages = [
    messageModel(
        name: 'Nino el dingo1',
        date: '1:23 p.m.',
        description: 'hey,how are you.',
        isMe: true,
        isSelected: false),
    messageModel(
        name: 'Nino el dingo2',
        date: '1:23 p.m.',
        description: 'I am good. And you?',
        isMe: false,
        isSelected: false),
    messageModel(
        name: 'Nino el dingo3',
        date: '1:23 p.m.',
        description: 'Same. So what you doing tonight?',
        isMe: true,
        isSelected: false),
    messageModel(
        name: 'Nino el dingo4',
        date: '1:23 p.m.',
        description: 'Let\'s catch up',
        isMe: true,
        isSelected: false),
    messageModel(
        name: 'Nino el dingo5',
        date: '1:23 p.m.',
        description: 'Sure thing!',
        isMe: false,
        isSelected: false),
    messageModel(
        name: 'Nino el dingo6',
        date: '1:23 p.m.',
        description: 'Cool,then be ready at 10 sharp.',
        isMe: true,
        isSelected: false),
    messageModel(
        name: 'Nino el dingo7',
        date: '1:23 p.m.',
        description: 'Got it.',
        isMe: false,
        isSelected: false),
    messageModel(
        name: 'Nino el dingo8',
        date: '1:23 p.m.',
        description: 'Bye',
        isMe: true,
        isSelected: false),
    messageModel(
        name: 'Nino el dingo9',
        date: '1:23 p.m.',
        description: 'Ok bye',
        isMe: false,
        isSelected: false),
  ];
}

class messageModel {
  final String name;
  final String date;

  final String description;
  bool isMe;
  bool isSelected;
  messageModel(
      {required this.name,
      required this.date,
      required this.description,
      required this.isMe,
      required this.isSelected});
}
