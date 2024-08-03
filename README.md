# Confirmation Dialog SwiftUI 📋
A SwiftUI package that creates sophisticated Confirmation Dialog aka Action Sheet inspired by WhatsApp's design.

## 👨🏻‍🏫 Introduction

> [!IMPORTANT]
> This confirmation dialog is designed for **iOS 17/+ iOS & iPadOS** SwiftUI Apps only.

> [!WARNING]
> You will not be able to manipulate the standard UI Components and their sizes, colors, alignments, etc... whatsoever.

> [!CAUTION]
> **Note**: Intended to use on a sheet only. ~~Not on a plain view~~. Otherwise, there will be color mismatches.

### Confirmation Dialog - consists of 3 Main Components
- Headline with/without Async Image
- Sub-Headline (text only)
- Buttons with roles
> [!Note]
> None of the above components depend on each other. So, you may use it as needed.

|Dark Mode|Light Mode|WhatsApp|
|-|-|-|
|<img src='https://github.com/KDTechniques/confirmation-dialog-swiftui/blob/main/readme_images/WhatsApp%20Action%20Sheet%20SwiftUI%20Preview%20-%20Dark%20Mode.png?raw=true' width='300'>|<img src='https://github.com/KDTechniques/confirmation-dialog-swiftui/blob/main/readme_images/WhatsApp%20Action%20Sheet%20SwiftUI%20Preview%20-%20Light%20Mode.png?raw=true' width='300'>|<img src='https://github.com/KDTechniques/confirmation-dialog-swiftui/blob/main/readme_images/Original%20WhatsApp%20Action%20Sheet%20Preview.png?raw=true' width='300'>|

## 🛠️ Installation

### Swift Package Manager

To integrate `confirmation-dialog-swiftui` into your Swift project, add the following dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/KDTechniques/confirmation-dialog-swiftui.git", from: "1.0.0")
]
```
### 🫛 CocoaPods
For CocoaPods, add the following to your Podfile:

```ruby
pod 'confirmation-dialog-swiftui', :git => '[https://github.com/KDTechniques/confirmation-dialog-swiftui.git](https://github.com/KDTechniques/confirmation-dialog-swiftui.git)'
```

## 💁🏻 How to Use

|UI Component|Parameters|Type|Description|
|-|-|-|-|
|ConfirmationDialogHeadlineView|text|String|Mandatory|
||textOnly|Bool (default = true)|If you don't need an image for the headline exclude the parameter or pass true. Otherwise, pass false.|
||imageURL|URL (optional)|If provided don't forget to set the 'textOnly' parameter to false. Otherwise, exclude the parameter.|
||placeholderSystemImageName|String (optional)|If the provided image URL fails or is nil at some point, this placeholder will be displayed.|
|||||
|ConfirmationDialogSubHeadlineView|text|String|Mandatory. Use '\n\n' if you want to go to a new line.|
|||||
|ConfirmationDialogButtonsView|buttonsArray|[ActionSheetButtonModel]|Mandatory. Use the 'role' parameter only for destructive actions. Otherwise, exclude the parameter.|
|||||
|ConfirmationDialogView|dismissAction|() -> Void|Mandatory. Use its closure to dismiss the action sheet, or to do something else.|

## 📖 Usage

> [!TIP]
> Create a new Swift file, and copy and paste this code block there. 
> Otherwise, create a new SwiftUI file, and use the 'DemoView()' to check this package for the first time.

``` swift
import SwiftUI
import ConfirmationDialogSwiftUI

public struct WhateverView: View {
    // MARK: - PROPERTIES
    @State private var isPresented: Bool = true
    
    let buttonsArray: [ActionSheetButtonModel] = [
        .init(text: "Send a gift", systemImageName: "gift") { },
        .init(text: "Contact Info", systemImageName: "info.circle") { },
        .init(text: "Add to trusted people", systemImageName: "person.badge.shield.checkmark") { },
        .init(text: "Recommend to a friend", systemImageName: "person.line.dotted.person") { },
        .init(text: "Lock conversation", systemImageName: "lock") { },
        .init(text: "Clear conversation", systemImageName: "xmark.circle") { }
    ]
    
    var destructiveButtonsArray: [ActionSheetButtonModel] { [
        .init(text: "Block John Doe", systemImageName: "hand.raised", role: .destructive) { },
        .init(text: "Delete Conversation", systemImageName: "trash", role: .destructive) { }
    ]}
    
    // MARK: - BODY
    public var body: some View {
        Button("Show Action Sheet") { isPresented.toggle() }
            .sheet(isPresented: $isPresented) {
                ConfirmationDialogView {
                    ConfirmationDialogHeadlineView(
                        text: "John Doe",
                        textOnly: false,
                        imageURL: .init(string: "https://picsum.photos/100"),
                        placeholderSystemImageName: "person.circle.fill"
                    )
                    
                    ConfirmationDialogSubHeadlineView("Blocked contacts will no longer be able to call you or send you messages.\n\nIf you block and report this contact, the last 5 messages will be forwarded to WhatsApp and your chat with this contact will be deleted from this device only.")
                    
                    ConfirmationDialogButtonsView { buttonsArray }
                    
                    ConfirmationDialogButtonsView { destructiveButtonsArray }
                } dismissAction: { isPresented = false }
            }
    }
}

// MARK: - PREVIEWS
#Preview("WhateverView") { WhateverView() }
```

## 🤝 Contribution
Contributions are welcome! If you have suggestions or improvements, please submit a pull request or open an issue on GitHub.

## 📜 License
`confirmation-dialog-swiftui` is released under the MIT License. See the [LICENSE](https://github.com/KDTechniques/confirmation-dialog-swiftui/blob/main/LICENSE) file for details.
