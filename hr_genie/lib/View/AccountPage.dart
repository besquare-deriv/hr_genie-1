import 'package:flutter/cupertino.dart';
import 'dart:ui';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_genie/Components/SubmitButton.dart';
import 'package:hr_genie/Controller/Cubit/AuthCubit/AuthCubit.dart';
import 'package:hr_genie/Routes/AppRoutes.dart';
import 'package:hr_genie/Routes/RoutesUtils.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Color(0xFF282828),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5000),
                        bottomRight: Radius.circular(5000),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ProfilePictureScreen(
                                      imageAsset: 'assets/logo.jpeg',
                                    ),
                                  ),
                                );
                              },
                              child: const Hero(
                                tag: 'profile_picture',
                                child: CircleAvatar(
                                  radius: 80,
                                  backgroundImage: AssetImage(
                                    'assets/logo.jpeg',
                                  ), // Replace with your own image asset
                                ),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 10,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF2A3C98),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    CommunityMaterialIcons.pencil,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    // Add your logic here
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'John Doe', // Replace with the user's name
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Software Engineer', // Replace with the user's occupation
                          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const RoundedField(
                icon: CommunityMaterialIcons.email,
                label: 'Email',
                value: 'johndoe@example.com', // Replace with the user's email
              ),
              const RoundedField(
                icon: CommunityMaterialIcons.card_account_details,
                label: 'NRIC',
                value: '980911105256', // Replace with the user's phone number
              ),
              const RoundedField(
                icon: CommunityMaterialIcons.briefcase,
                label: 'Department',
                value: 'Department of Quality Assurance', // Replace with the user's department
              ),
              const RoundedField(
                icon: CommunityMaterialIcons.phone,
                label: 'Phone',
                value: '+1 123-456-7890', // Replace with the user's phone number
              ),
              const RoundedField(
                icon: CommunityMaterialIcons.gender_male_female,
                label: 'Gender',
                value: 'Male', // Replace with the user's gender
              ),
              const SizedBox(
                height: 30,
              ),
              SubmitButton(
                label: "Log Out",
                onPressed: () {
                  context.read<AuthCubit>().signOut(context);
                  AppRouter.router.go(PAGES.login.screenPath);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}




class RoundedField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const RoundedField({super.key, 
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), 
            ),
            child: Icon(
              icon,
              size: 24,
              color: Colors.white, // Set the icon color to white
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            
            child: Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF282828), // Blackish grey color
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white), // Set the label text color to white
                  ),
                  Text(
                    value,
                    style: const TextStyle(color: Colors.white), // Set the value text color to white
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePictureScreen extends StatelessWidget {
  final String imageAsset;

  const ProfilePictureScreen({Key? key, required this.imageAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Center(
              child: Hero(
                tag: 'profile_picture',
                child: CircleAvatar(
                  radius: 180,
                  backgroundImage: AssetImage(imageAsset),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
