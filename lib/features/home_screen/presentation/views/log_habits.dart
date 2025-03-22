import 'package:flutter/material.dart';
import 'package:rise/core/config/extensions.dart';
import 'package:rise/core/utils/picker.dart';
import 'package:rise/features/home_screen/presentation/widgets/log_habit_widgets.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _habitNameController = TextEditingController();
  String? _selectedCategory;
  String? _selectedFrequency;
  TimeOfDay? _reminderTime;
  bool _isSaving = false;

  final List<String> categories = ["Health", "Productivity", "Mindfulness", "Learning"];
  final List<String> frequencies = ["Daily", "Weekly", "Monthly"];

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack));
    _animationController.forward();
  }

  @override
  void dispose() {
    _habitNameController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _saveHabit() {
    if (_habitNameController.text.isEmpty || _selectedCategory == null || _selectedFrequency == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields")));
      return;
    }

    setState(() {
      _isSaving = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isSaving = false;
      });
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create a Habit", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card with light mode colors
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLabel("🎯 Habit Name"),
                    buildTextField("Enter habit name", _habitNameController, Icons.edit),

                    buildLabel("📂 Category"),
                    buildDropdown(categories, "Select Category", Icons.category, (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }),
                    15.height(),

                    buildLabel("⏳ Frequency"),
                    buildDropdown(frequencies, "Select Frequency", Icons.repeat, (value) {
                      setState(() {
                        _selectedFrequency = value;
                      });
                    }),
                    15.height(),

                    buildLabel("⏰ Reminder"),
                    GestureDetector(
                      onTap: () async {
                        final pickedTime = await pickTime(context);

                        if (pickedTime != null) {
                          setState(() {
                            _reminderTime = pickedTime;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _reminderTime == null ? "Set Reminder" : _reminderTime!.format(context),
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(Icons.alarm, color: Colors.black54),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              50.height(),

              // Save Button with Animation
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveHabit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child:
                        _isSaving
                            ? SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white))
                            : Text("🚀 Save Habit", style: TextStyle(fontSize: 16, color: Colors.white)),
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
