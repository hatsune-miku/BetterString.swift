# BetterString.swift
String extension for Swift 5. Make strings as simple as it should be.
## Get rid of Range, Index, ...

```swift
"google.com".ensureStarts(with: "https://")
# => "https://google.com"

"/var/www/html".ensureEnds(with: "/")
# => "/var/www/html/"

"Hello".find(anotherString: "ello")
# => 1

var str = "Hello"
str.length # => 5
str.length = 4
print(str) # => "Hell"

"Hllo".insert(what: "e", at: 1)
# => "Hello"

"2020".matches(regex: "^[0-9]+$")
# => true

"password@".matches(regex: "^[a-zA-Z0-9]+$")
# => false

"123a123b123c123d".replaceAll(regex: "[0-9]", replaceWith: "")
# => "abcd"
// func replaceAll(regex: String, replaceWith: String, options: NSRegularExpression.MatchingOptions) -> String


"12345".took() # => "2345"
"12345".took(1) # => "2345"
"12345".took(2) # => "345"
"12345".took(3) # => "45"

"12345".drop() # => "1234"
"12345".drop(1) # => "1234"
"12345".drop(2) # => "123"
"12345".drop(3) # => "12"

"1a2a3a4a5a6".without("a") # => "123456"
"1a2a3a4a5a6".no("a") # => "123456"
# without = no

"Star".repeats(forHowManyTimes: 2)
# => "StarStar"

"123456".left(3) = "123"
"123456".right(3) = "456"
"123456".mid(2, 4) = "34"
"123456".mid(2...4) = "34"
"123456".mid(2..<5) = "34"
"123456".mid(2, -1) = "3456"
"123456".mid(2, -2) = "345"

"123456".before("456") # => "123"
"123456".to("45") # => "12345"
"123456".after("123") # => "456"
"123456".from("23") # => "23456"

"123456".between("12", and: "56")
# => "34"

"1##2##3##4##5".split(by: "##")
# => ["1", "2", "3", "4", "5"]

"aaa".split(by: "##")
# => ["aaa"]

```
