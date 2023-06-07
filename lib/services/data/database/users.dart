import 'package:furniture_app/models/user_model.dart';

User? currentUser;

final user1 = User(
  userId: "0",
  name: "a",
  email: "a",
  password: "a",
  createdAt: "06.05.2023",
  modifyAt: "06.05.2023",
  devices: [],
  cards: <int>[],
  favourites: <int>[],
);

final usersList = <User>[
  user1,
];

