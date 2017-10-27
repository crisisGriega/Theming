# Theming

## Synopsis

The main idea behind this project is to keep all the appereance code (font, color, alignment, etc) under one structure, making it simple to change and maintain, instead of going through all the storyboards and xib files.

So I tried to get some of the ideas of CSS and apply them to Swift.

The visual attributes are stored in a class called Style. Those styles are linked to a name in a Stylesheet, a Dictionary<String: Style>.
In every UI element there is a IBDesignable where to write the key used for storing the Style in the Stylesheet. So all the UI elements which have the same style name, will share visual font, color, etc.

In order to apply one Stylesheet or another it needs to be assigned to the static Theme class.

Just to avoid to subclass all the UILabel, UIButton, etc. I have applied swizzling techniques so it's completely transparent in order to be used.

Because this is just an example, there are defined extensions for UILabel, UITextView, UIButton but the whole theming idea can be applied to other elements just creating new extensions.

## Code Example

First create a Style passing the desired attributes to the constructor:
```Swift
let body = Style(font: UIFont(name: "Verdana", size: 12.0), textColor: .gray);
```
Then assign that styles to its id (h1, for instance) storing it in a Stylesheet (Dictionary<String: Style>)
```Swift
var stylesheet = Stylesheet();
stylesheet["h1"];
```

Apply that stylesheet, assigning it to Theme as default.
```Swift
Theme.currentTheme = self.stylesheet;
```

## Author

Gerardo Garrido, @crisisGriega

## License

Theming is available under the MIT license. See the LICENSE file for more info.
