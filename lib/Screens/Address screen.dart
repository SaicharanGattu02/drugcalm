// import 'package:drugcalm/utils/constants.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   String? selectedGender;
//   final TextEditingController dateOfBirthController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     var w = MediaQuery.of(context).size.width;
//     var h = MediaQuery.of(context).size.height;
//     return Scaffold(
//
//       appBar: AppBar(
//           // title: Row(
//           //   children: [
//           //       Stack(
//           //         children: [
//           //           CircleAvatar(
//           //             radius: 25,
//           //             backgroundColor: Colors.grey[300],
//           //             child: Icon(Icons.person, size: 30, color: Colors.white),
//           //           ),
//           //           Positioned(
//           //             bottom: 0,
//           //             right: 0,
//           //             child: CircleAvatar(
//           //               radius: 10,
//           //               backgroundColor: Colors.blue,
//           //               child: Icon(Icons.add, size: 14, color: Colors.white),
//           //             ),
//           //           ),
//           //         ],
//           //       ),
//           //       SizedBox(width: 10),
//           //       Column(
//           //         crossAxisAlignment: CrossAxisAlignment.start,
//           //         children: [
//           //           Text(
//           //             'User ID',
//           //             style: TextStyle(fontSize: 14, color: Colors.white),
//           //           ),
//           //           Text(
//           //             'user@example.com',
//           //             style: TextStyle(fontSize: 12, color: Colors.white70),
//           //           ),
//           //         ],
//           //       ),
//           //     ],
//           //   ),
//           ),
//
//
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//
//             children: [
//               container(context,
//                   colors: color4,
//                   padding: EdgeInsets.all(16),
//                   borderRadius: BorderRadius.circular(8),
//                   // margin: EdgeInsets.symmetric(horizontal: 16),
//                   child: Column( crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       text(context, 'Full Name', 14,color: color24,
//                           fontWeight: FontWeight.w400),
//                       TextField(
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                       SizedBox(height: 16),
//
//                       // Gender Selection Row
//                       Text('Gender'),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _genderButton('Male'),
//                           _genderButton('Female'),
//                           _genderButton('Other'),
//                         ],
//                       ),
//                       SizedBox(height: 16),
//                       text(context, 'Date of Birth', 14,color: color24,
//                           fontWeight: FontWeight.w400),
//                       // Date of Birth Field with Calendar Icon
//                       TextField(
//                         controller: dateOfBirthController,
//                         decoration: InputDecoration(
//                           labelText: '',
//                           border: OutlineInputBorder(),
//                           suffixIcon: Icon(Icons.calendar_today),
//                         ),
//                         readOnly: true,
//                         onTap: _selectDate,
//                       ),
//                       SizedBox(height: 16),
//
//                       // Phone Number Field
//                       text(context, 'Phone Number', 14,color: color24,
//                           fontWeight: FontWeight.w400),
//                       TextField(
//                         decoration: InputDecoration(
//
//                           border: OutlineInputBorder(),
//                         )
//                       ),
//                       SizedBox(height: 16),
//                       text(context, 'Email ID', 14,color: color24,
//                           fontWeight: FontWeight.w400),
//                       // Email ID Field
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Email ID',
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ],
//                   )),
//
//               // Health Information Heading
//
//
//
//               Text(
//                 'Health Information:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//
//               // Age and Blood Group Row
//               Row(
//                 children: [
//                   Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       text(context, 'Age', 14,color: color24,textAlign: TextAlign.start,
//                           fontWeight: FontWeight.w400),
//                       SizedBox(height: h*0.01,),
//                       Container(width: w*0.45,
//                         child: TextField(
//                           decoration: InputDecoration(
//                             labelText: 'Age',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: w*0.01,),
//                   Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       text(context, 'Blood Group', 14,color: color24,textAlign: TextAlign.start,
//                           fontWeight: FontWeight.w400),
//                       SizedBox(height: h*0.01,),
//                       Container(width: w*0.45,
//                         child: TextField(
//                           decoration: InputDecoration(
//                             labelText: 'Blood Group',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//
//                 ],
//               ),
//
//               SizedBox(height: 16),
//
//               // Height and Weight Row
//               Row(
//                 children: [
//                   Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       text(context, 'Height', 14,color: color24,textAlign: TextAlign.start,
//                           fontWeight: FontWeight.w400),
//                       SizedBox(height: h*0.01,),
//                       Container(width: w*0.45,
//                         child: TextField(
//                           decoration: InputDecoration(
//                             labelText: 'Height',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: w*0.01,),
//                   Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       text(context, 'Weight', 14,color: color24,textAlign: TextAlign.start,
//                           fontWeight: FontWeight.w400),
//                       SizedBox(height: h*0.01,),
//                       Container(width: w*0.45,
//                         child: TextField(
//                           decoration: InputDecoration(
//                             labelText: 'Weight',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//
//                 ],
//               ),
//               SizedBox(height: 32),
//
//               // Update Profile Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Handle profile update
//                   },
//                   child: Text('Update Profile'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method for gender selection button
//   Widget _genderButton(String gender) {
//     return Expanded(
//       child: ElevatedButton(
//         onPressed: () {
//           setState(() {
//             selectedGender = gender;
//           });
//         },
//         style: ElevatedButton.styleFrom(
//           foregroundColor:
//               selectedGender == gender ? Colors.white : Colors.black,
//           backgroundColor:
//               selectedGender == gender ? Colors.blue : Colors.grey[300],
//         ),
//         child: Text(gender),
//       ),
//     );
//   }
//
//   // Method to select date
//   Future<void> _selectDate() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//
//     if (pickedDate != null) {
//       setState(() {
//         dateOfBirthController.text =
//             "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
//       });
//     }
//   }
// }
