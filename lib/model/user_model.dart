import 'package:cloud_firestore/cloud_firestore.dart';

class userModel{
  late String name;
  late String publickey;
  late String ?profilepicurl;
  late String ?followers;
  late String ?joinedpools;
  late String ?following;
  late String ?poolsize;
  late String ?stakerange;
  late String ?apy;
  late String ?rewardpercentage;
  late String gender;
  late String ?bio;
  late List<String> followersList;
  late List<String> followingsList;


  userModel({
    required this.name,
    required this.publickey,
    this.profilepicurl,
    this.joinedpools,
    this.followers,
    this.following,
    this.poolsize,
    this.stakerange,
    this.apy,
    this.rewardpercentage,
    required this.gender,
    required this.bio
  });


  Map<String,Object?> tomap(){
    return {
     'name':name,
     'publickey':publickey,
     'profilepicurl':profilepicurl,
     'rewardpercentage':rewardpercentage,
     'gender':gender,
     'bio ':bio
    };
  }











}