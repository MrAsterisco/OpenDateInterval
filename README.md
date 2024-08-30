# OpenDateInterval
[![Test](https://github.com/MrAsterisco/OpenDateInterval/actions/workflows/test.yml/badge.svg)](https://github.com/MrAsterisco/OpenDateInterval/actions/workflows/test.yml)

OpenDateInterval is an extended implementation of the `DateInterval` class that represents a potentially open ended interval of dates.

## Installation
DateRangePicker is available through [Swift Package Manager](https://swift.org/package-manager).

```swift
.package(url: "https://github.com/MrAsterisco/OpenDateInterval", from: "<see GitHub releases>")
```

### Latest Release
To find out the latest version, look at the Releases tab of this repository.

## Usage
OpenDateInterval can be initialized with only a start date or with both a start and end date.

```swift
let openInterval = OpenDateInterval(start: Date())
let closedInterval = OpenDateInterval(start: Date(), end: Date())
```

You can check whether an interval is open ended or not by invoking:

```swift
let openInterval = OpenDateInterval(start: Date())
let closedInterval = OpenDateInterval(start: Date(), end: Date())

print(openInterval.isOpenEnded) // -> true
print(closedInterval.isOpenEnded) // -> false
```

OpenDateInterval also allows you to check whether another date is contained in the interval and whether two intervals intersect:

```swift
// Contains

let startDate = Date(timeIntervalSinceReferenceDate: 0)
let endDate = Date(timeIntervalSinceReferenceDate: 2)
let testDate = Date(timeIntervalSinceReferenceDate: 1)

let interval = OpenDateInterval(start: startDate, end: endDate)

print(interval.contains(testDate)) // -> true

// Intersects

let interval1 = OpenDateInterval(start: Date(timeIntervalSinceReferenceDate: 0), end: Date(timeIntervalSinceReferenceDate: 2))
let interval2 = OpenDateInterval(start: Date(timeIntervalSinceReferenceDate: 1), end: Date(timeIntervalSinceReferenceDate: 3))

print(interval1.intersects(interval2)) // -> true
```

## UI
If you are looking for a SwiftUI component that allows users to construct an `OpenDateInterval`, check out [DateRangePicker](https://github.com/MrAsterisco/DateRangePicker).

## Compatibility
OpenDateInterval is compatible with any platform that supports Swift 5.10 or higher.

## Contributions
All contributions to expand the library are welcome. Fork the repo, make the changes you want, and open a Pull Request.

If you make changes to the codebase, I am not enforcing a coding style, but I may ask you to make changes based on how the rest of the library is made.

## Status
This library is under **active development**. Even if most of the APIs are pretty straightforward, **they may change in the future**; but you don't have to worry about that, because releases will follow [Semantic Versioning 2.0.0](https://semver.org/).

## License
DateRangePicker is distributed under the MIT license. [See LICENSE](https://github.com/MrAsterisco/OpenDateInterval/blob/main/LICENSE) for details.
