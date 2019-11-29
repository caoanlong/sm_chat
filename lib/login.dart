import 'package:flutter/material.dart';

class Login extends StatefulWidget {
	@override
	State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
	TextEditingController _unameController = new TextEditingController();
	TextEditingController _pwdController = new TextEditingController();

	GlobalKey _formKey = new GlobalKey<FormState>();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('登录'),
			),
			body: Padding(
				padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24.0),
				child: Form(
					key: _formKey,
					autovalidate: true,
					child: Column(
						children: <Widget>[
						TextFormField(
							controller: _unameController,
							decoration: InputDecoration(
								prefixIcon: Icon(Icons.people),
								labelText: '用户名',
								hintText: '用户名或邮箱'
							),
							validator: (v) {
								return v.trim().length > 0 ? null : '用户名不能为空';
							}
						),
						TextFormField(
							controller: _pwdController,
							decoration: InputDecoration(
								prefixIcon: Icon(Icons.lock),
								labelText: '密码',
								hintText: '登录密码'
							),
							validator: (v) {
								return v.trim().length > 5 ? null : '密码不能少于6位';
							}
						),
						Padding(
							padding: const EdgeInsets.only(top: 28.0),
							child: Row(
							children: <Widget>[
								Expanded(
								child: RaisedButton(
									padding: EdgeInsets.all(15.0),
									child: Text('登录'),
									color: Theme.of(context).primaryColor,
									textColor: Colors.white,
									onPressed: () {
									if ((_formKey.currentState as FormState).validate()) {
										// 验证通过
									}
									},
								),
								)
							],
							),
						)
						],
					)
				)
			)
		);
	}
}