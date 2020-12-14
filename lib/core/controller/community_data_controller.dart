// import 'package:phone_blocker/core/models/community.dart';

// class CommunityDataController {
//   final List<CommunityModel> communities = [
    
//   ];

//   CommunityDataController._privateContructor();

//   static final CommunityDataController instance =
//       CommunityDataController._privateContructor();

//   List<CommunityModel> getCommunities() {
//     return communities;
//   }

//   List<CommunityModel> getBlockedCommunities() {
//     return communities.where((element) => element.isBlocked);
//   }

//   void setBlocked(int index, bool isBlocked) {
//     communities[index].isBlocked = isBlocked;
//   }

//   void like(int index) {
//     communities[index].hasLiked = !communities[index].hasLiked;
//     communities[index].likes += communities[index].hasLiked ? 1 : -1; 
//   }

//   CommunityModel getItem(int index) {
//     return communities[index];
//   }
// }
