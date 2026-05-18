import 'package:flutter/material.dart';
 
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6C63FF))),
      home: const RegistrationPage(),
    ));
 
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}
 
class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey        = GlobalKey<FormState>();
  final _emailCtrl      = TextEditingController();
  final _passwordCtrl   = TextEditingController();
  final _phoneCtrl      = TextEditingController();
  bool  _hidePassword   = true;
 
  @override
  void dispose() {
    _emailCtrl.dispose(); _passwordCtrl.dispose(); _phoneCtrl.dispose();
    super.dispose();
  }
 
  // ── Validators ────────────────────────────────────────────────
  String? _emailVal(String? v) {
    if (v == null || v.isEmpty) return 'Email is required';
    final p = v.trim().split('@');
    return (p.length == 2 && p[0].isNotEmpty && p[1].isNotEmpty) ? null : 'Must contain "@"';
  }
 
  String? _passVal(String? v) {
    if (v == null || v.isEmpty) return 'Password is required';
    return v.length >= 8 ? null : 'Min. 8 characters';
  }
 
  String? _phoneVal(String? v) {
    if (v == null || v.trim().isEmpty) return null;
    final d = v.replaceAll(RegExp(r'[\s\-\+\(\)]'), '');
    if (!RegExp(r'^\d+$').hasMatch(d)) return 'Digits only';
    return (d.length >= 7 && d.length <= 15) ? null : '7–15 digits required';
  }
 
  // ── Submit ────────────────────────────────────────────────────
  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('🎉 Registered successfully!'),
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ));
    }
  }
 
  void _reset() {
    _formKey.currentState!.reset();
    _emailCtrl.clear(); _passwordCtrl.clear(); _phoneCtrl.clear();
  }
 
  // ── Shared field decoration ────────────────────────────────────
  InputDecoration _dec(String label, IconData icon, {Widget? suffix}) =>
      InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.grey.shade100,
        labelStyle: const TextStyle(fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF6C63FF), width: 1.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.8),
        ),
      );
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header ────────────────────────────────────────
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C63FF).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.person_add_alt_1_rounded,
                      color: Color(0xFF6C63FF), size: 26),
                ),
                const SizedBox(height: 20),
                const Text('Create Account',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, height: 1.2)),
                const SizedBox(height: 6),
                Text('Fill in the details to get started.',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500)),
                const SizedBox(height: 36),
 
                // ── Email ─────────────────────────────────────────
                TextFormField(
                  controller: _emailCtrl,
                  decoration: _dec('Email Address', Icons.alternate_email_rounded),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: _emailVal,
                ),
                const SizedBox(height: 16),
 
                // ── Password ──────────────────────────────────────
                TextFormField(
                  controller: _passwordCtrl,
                  obscureText: _hidePassword,
                  decoration: _dec('Password', Icons.lock_outline_rounded,
                    suffix: GestureDetector(
                      onTap: () => setState(() => _hidePassword = !_hidePassword),
                      child: Icon(
                        _hidePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        size: 20, color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: _passVal,
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text('Must be at least 8 characters',
                      style: TextStyle(fontSize: 11, color: Colors.grey.shade400)),
                ),
                const SizedBox(height: 16),
 
                // ── Phone ─────────────────────────────────────────
                TextFormField(
                  controller: _phoneCtrl,
                  decoration: _dec('Phone Number ', Icons.phone_outlined),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submit(),
                  validator: _phoneVal,
                ),
                const SizedBox(height: 36),
 
                // ── Register Button ───────────────────────────────
                GestureDetector(
                  onTap: _submit,
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6C63FF), Color(0xFF9C8FFF)],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6C63FF).withOpacity(0.35),
                          blurRadius: 16, offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text('Register',
                        style: TextStyle(color: Colors.white, fontSize: 16,
                            fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                  ),
                ),
                const SizedBox(height: 16),
 
                // ── Reset ─────────────────────────────────────────
                Center(
                  child: TextButton(
                    onPressed: _reset,
                    child: Text('Reset Form',
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}