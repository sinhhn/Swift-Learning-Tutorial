# Swift-Learning-Tutorial
### Link design to code
* Add control (Button, UIImage) to story board
* Hold Ctrl + Drag control to controller class
* Select type of connect and something else


### make random number

```swift
randomIndex = Int(arc4random_uniform(5))
```

### Shake event handling
When you would to like handle shaking event on physical device. iOS have beed provided methods that make you can handle this event simply.

	
```swift
override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
	// handle what happen here
}
	
```
	
