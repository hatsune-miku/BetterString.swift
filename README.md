# BetterString.swift
String extension for Swift 5. Make strings as simple as it should be. Get rid of Range, Index, ...

```swift
"12345".begins(with: "12")
```
result type: Bool
result value: true

```swift
"/var/www/html".ensureEnds(with: "/")
"/var/www/html/".ensureEnds(with: "/")
```
result type: String
result value: "/var/www/html/"
