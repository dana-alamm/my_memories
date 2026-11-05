import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_memories/core/cubit/weather_cubit.dart';
import 'package:my_memories/core/cubit/weather_state.dart';
import 'package:my_memories/core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  final String displayLocation;
  const HomeHeader({super.key, required this.displayLocation});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Flexible(
              
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'HELLO DANA!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const Text(
                      'My World',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                        letterSpacing: -0.32,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$displayLocation, 2 memories',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(width: 10),
            
           BlocBuilder<WeatherCubit,WeatherState>(
            builder: (context,state){
              if(state is WeatherLoading){
                return Container(
                  padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2,color:Colors.orange),
                    ),
                );
              }
              else if(state is WeatherLoaded){
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85), 
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
                  ),
                 child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.cloud_outlined,
                    color: Colors.orange,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${state.weather.temp}°',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        '${state.weather.description}',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
                  );
            
              }
              else{
                return const SizedBox();
              }
            }
            )
           
          ],
        ),
      ),
    );
  }
}