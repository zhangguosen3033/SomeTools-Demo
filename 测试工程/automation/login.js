
var target = UIATarget.localTarget();

target.frontMostApp().mainWindow().buttons()["登录"].tap();
target.frontMostApp().mainWindow().textFields()[0].tap();
target.frontMostApp().keyboard().keys()["刪除"].tapWithOptions({tapCount:11});
target.frontMostApp().keyboard().typeString("13141152232");
target.frontMostApp().mainWindow().secureTextFields()[0].tap();
target.frontMostApp().keyboard().keys()["Delete"].tap();
target.frontMostApp().keyboard().typeString("111111");
target.frontMostApp().mainWindow().buttons()["登录"].tap();
