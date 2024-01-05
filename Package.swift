// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "Phrase",
    products: [
        .library(
            name: "Phrase",
            targets: ["Phrase"]),
    ],
    targets: [
        .target(
            name: "Phrase",
            dependencies: []),
        .testTarget(
            name: "PhraseTests",
            dependencies: ["Phrase"]),
    ]
)
