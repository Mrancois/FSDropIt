# FSDropIt

Installation
-
FSDropt is a framework available in Cocoapods.
To install add this line to your Podfile :

pod 'FSDropIt'


Usage
-
``` swift
import FSDropIt
```

And add

``` swift
m = FSDropIt(items: theItems as [AnyObject], x: 25.0, y: 25.0, width: 110.0, heightBtn: 45.0, heightView: 150.0)
self.view.addSubview(m)
```

Your can use :
```swift 
changeTextButton(texte:String)
setTableviewBackgroundColor(color : UIColor!)
setButtonBackgroundColor(color : UIColor!)
setButtonBorder(borderWidth:Float, borderColor : UIColor)
setTableviewBorder(borderWidth:Float, borderColor : UIColor)
```

Go get the value use : 
```swift
m.getButtonText()
```
