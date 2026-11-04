import 'package:flutter/material.dart';
import 'package:my_memories/core/theme/app_colors.dart';
import 'package:my_memories/core/widgets/gradient_background.dart';
import 'package:my_memories/features/auth/screens/login_screen.dart';
import 'package:my_memories/features/auth/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black87,
                        size: 18,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 120),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Create Your Account',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 60),
                        CustomTextField(
                          labelText: 'Enter full name',
                          prefixIcon: Icons.abc_outlined,
                        ),
                        const SizedBox(height: 30),
                        CustomTextField(
                          labelText: 'Enter your email',
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 30),
                        CustomTextField(
                          labelText: 'Enter your password',
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                        ),
                       
                        const SizedBox(height: 20),

                        Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFFCC80),

                                Color(0xFFFFE0B2),
                                Color(0xFF9FA8DA),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child:ElevatedButton(
                            onPressed: (){}, 
                            style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                               style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                            ),
                        
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(thickness: 1,color:Colors.grey),
                              
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'Sign Up With',
                                  style: TextStyle(color:Colors.grey.shade600),
                                ),
                                ),
                                 const Expanded(
                              child: Divider(thickness: 1, color: Colors.grey),
                            ),
                          ],
                        ),
                         const SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 60,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.facebook,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                              
                                 
                                ),
                                child: Image.asset('assets/images/google-icon-removebg-preview.png'),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            IconButton(onPressed: (){},
                            iconSize: 60,
                             icon: Icon(Icons.apple,
                             color:Colors.black)
                             )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                color:Colors.grey
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(
                                  context, 
                                  MaterialPageRoute(builder: (context)=>LoginScreen()));
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  color:AppColors.primaryColor,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                      
                      
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
