Chorizo
=======

Chorizo is a Swift library that enables a fluent interface on existing classes and structures in the standard Swift and Cocoa Touch libraries.

Here is an example of what you can do with Chorizo:

```swift
let value = "Foo".and("Bar").separatedBy(" ")
```

This will give you `"Foo Bar"` as a String object.

The equivalent of this if you wanted to write the code with pure Swift would be:

```swift
var value = ""
let array = ["Foo", "Bar"]
let separator = " "
for str in array{
  value += str
  if str != array.last!{
    value += separator
  }
}
```
Interested? Read on.

---
