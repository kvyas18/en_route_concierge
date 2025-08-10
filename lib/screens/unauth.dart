import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:en_route_concierge/router.dart';
import 'package:en_route_concierge/styles/colors.dart';

class UnAuth extends StatefulWidget {
  @override
  _UnAuthState createState() => _UnAuthState();
}

class _UnAuthState extends State<UnAuth> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Delay to allow animation
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🌄 Background image
          Image.asset(
            "assets/images/bg.jpg",
            fit: BoxFit.cover,
          ),

          // 🖤 Overlay
          Container(color: Colors.black.withOpacity(0.4)),

          // 🌟 Foreground UI
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 115),

                // 🔰 Fading Logo
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  child: Image.asset(
                    'assets/images/white-logo.png',
                    height: 120,
                  ),
                ),

                const Spacer(),

                // 🔁 Login & Register Buttons (transparent)
                Row(
                  children: <Widget>[
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(LoginRoute);
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(RegisterRoute);
                        },
                        child: const Text(
                          "REGISTER",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),

                // 🔹 Divider
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.white70)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Or connect with social",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white70)),
                  ],
                ),
                const SizedBox(height: 20.0),

                // 🌐 Facebook
                Container(
                  height: 45.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    children: const <Widget>[
                      SizedBox(width: 15),
                      Icon(FontAwesomeIcons.facebookSquare, color: Colors.white),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "Login with Facebook",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),

                // 🌐 Google
                Container(
                  height: 45.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    children: const <Widget>[
                      SizedBox(width: 15),
                      Icon(FontAwesomeIcons.google, color: Colors.white),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "Login with Google",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
