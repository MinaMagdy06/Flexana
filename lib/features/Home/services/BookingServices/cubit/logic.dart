import 'package:flexana/features/Home/services/BookingServices/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState());

  void changeDate(String date) => emit(state.copyWith(date: date));
  void changeYogaType(String type) => emit(state.copyWith(yogaType: type));
  void changeInstructor(String instructor) =>
      emit(state.copyWith(instructor: instructor));
  void changeLevel(String level) => emit(state.copyWith(level: level));
}
