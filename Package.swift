// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "confirmation-dialog-swiftui",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ConfirmationDialogSwiftUI",
            targets: ["ConfirmationDialogSwiftUI"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.10.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "3.1.1")
    ],
    targets: [
        .target(
            name: "ConfirmationDialogSwiftUI",
            dependencies: ["SDWebImageSwiftUI"],
            path: "Sources/Confirmation Dialog"
        ),
    ]
)
