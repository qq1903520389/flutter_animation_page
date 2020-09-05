# animation_page

A new Flutter package project.

## Installing
Add this to your package's pubspec.yaml file:
```
dependencies:
  animation_page: ^0.0.1
```

## Custom
```
@override
buildTransform(Animation animation) {
    return Matrix4.translationValues( 50 * (1.0 - animation.value), 50 * (1.0 - animation.value), 0.0);
}
```

## Example
> demo code

```
class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage>
    with TickerProviderStateMixin, AnimationPageMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: initAnimationList(widgetList, controller),
      ),
    );
  }

  List<Widget> widgetList = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        child: RaisedButton(
          onPressed: () {},
          color: Colors.blue,
          child: Icon(Icons.add, size: 50,),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        child: Image.asset(
          'assets/eat_cape_town_sm.jpg',
          height: 200,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.green,
        child: Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 30
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.pink,
      ),
    ),
  ];
}
```
### example 1
```
@override
buildTransform(Animation animation) {
    return Matrix4.translationValues( 20 * (1.0 - animation.value), 20 * (1.0 - animation.value), 0.0);
}
```
![example1.gif](https://github.com/wuweijian1997/flutter_animation_page/blob/master/example1.gif)
### example 2
```
@override
buildTransform(Animation animation) {
    return Matrix4.translationValues( 30 * (1.0 - animation.value), 0, 0.0);
}
```
![example2.gif](https://github.com/wuweijian1997/flutter_animation_page/blob/master/example2.gif)
### example 3
```
@override
buildTransform(Animation animation) {
    return Matrix4.translationValues( 0, 30 * (1.0 - animation.value), 0.0);
}
```
![example3.gif](https://github.com/wuweijian1997/flutter_animation_page/blob/master/example3.gif)
### example 4
```
@override
buildTransform(Animation animation) {
    return Matrix4.translationValues( 0, -30 * (1.0 - animation.value), 0.0);
}
```
![example4.gif](https://github.com/wuweijian1997/flutter_animation_page/blob/master/example4.gif)