# Phrase - Swift Templating Library

Phrase is a Swift templating library.

## Installation

There are two ways to use Phrase currently:

- __Cocoapods__

- __Swift Package Manager__

## Concepts

### Token

A token is a item that is to be replace. It is identifier by a key surrounded by braces.

__Examples:__ `{name}`, `{age}`, `{year}`.

### Template

A template is a string of text that contains tokens to be replaced.

__Examples:__:  `The {fruit} is the color {color}.`, `{name} is {age} years old!`.

## Usage

### `Initialization`

Phrase is extremely easy to use. The only initial requirement for creating a `Phrase` is a template.

```swift
Phrase(template: "Hi {name}, I am {age} years old.")
```

### `func put(key: String, value: CustomStringConvertable) -> Phrase`

After initialization it is time to supply the `Phrase` with keys to be replaced. Using this method, we can designate to replace any key with a value that conforms to `CustomStringConvertable)`. Notice that this method returns itself to allow easy chaining.

Note that attempting to use the same `key` more than once will result in the **last** value supplied being used.

```swift
let example = Phrase(template: "Hi {name}, I am {age} years old.")

example.put(key: "name", value: "Cody")
example.put(key: "age", value: 21)
```

### `func format() -> String`

Finally, when you are done adding replacements for the template it is time to build the string. This will replace any instance of the supplied keys with the value given.

```swift
let greeting = Phrase(template: "Hi {name}, I am {age} years old.")
	.put(key: "name", value: "Cody")
	.put(key: "age", value: 21)
	.format()

print(greeting) // Prints: "Hi Cody, I am 21 years old."
```

## Inspired By

This project was inspired by the following project by Square. It is a Swift inspired port of it.

https://github.com/square/phrase

## License

> Copyright 2017 Cody Robertson
>
> Licensed under the Apache License, Version 2.0 (the "License");
> you may not use this file except in compliance with the License.
> You may obtain a copy of the License at
>
>    http://www.apache.org/licenses/LICENSE-2.0
>
> Unless required by applicable law or agreed to in writing, software
> distributed under the License is distributed on an "AS IS" BASIS,
> WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> See the License for the specific language governing permissions and
> limitations under the License.
