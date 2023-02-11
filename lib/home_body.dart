import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int? age;
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();

  void _calculateAge() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your year of birth"),
        ),
      );
    } else {
      final int yearOfBirth = int.parse(_controller.text);
      final int currentYear = DateTime.now().year;
      setState(() {
        age = currentYear - yearOfBirth;
        isLoading = false;
        _controller.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/female.png",
          ),
          Text(
            "Finding your age...",
            style:
                TextStyle(fontSize: 30, color: Theme.of(context).primaryColor),
          ),
          if (age != null)
            Text(
              "Your age is $age",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter year of birth',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 50),
            ),
            onPressed: _calculateAge,
            child: const Text('Submit'),
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
