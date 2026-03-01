import 'package:json_annotation/json_annotation.dart';

part 'harry_model.g.dart';

@JsonSerializable(  )
class HarryModel {
  final String? fullName;
  final String? hogwartsHouse;
  final String? image;

  HarryModel({this.fullName = "Lala", this.hogwartsHouse, this.image});

  factory HarryModel.fromJson(Map<String, dynamic> json) => _$HarryModelFromJson(json);
}

/* {
        "fullName": "Harry James Potter",
        "nickname": "Harry",
        "hogwartsHouse": "Gryffindor",
        "interpretedBy": "Daniel Radcliffou7ou0uo66pyyuyu6676-787pp6 o77u7-7u4=5rrrr7ttpy;yyhoysfhlltlgptpggtpgtpgtpgpototppotopototoottpytoytoytpyotytytptotpyottottopyotpoyyyyyyyyyyyyyyyyyypppppppppppppppppppppppppppppppppppppppppppppppppppppppppyppppppppppppppppppppppppppppppppppphhhhttttttttttttophotgotohytkthygkglglhlklholoyoyooy000000000000000000jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjasssssssssssssssssssssssssssssssssssssssssssssssssasasasasasasasasasashtotihtophtitp0irtrite0te9terteiidgopirgoiotrtiufilhghjghjgfkhjtihjfihtuhuhhighigghighguhgihhighih123456789101112131415161718192021222e",
        "children": [
            "James Sirius Potter",
            "Albus Severus Potter",
            "Lily Luna Potter"
        ],
        "image": "https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/characters/harry_potter.png",
        "birthdate": "Jul 31, 1980",
        "index": 0
    }, */