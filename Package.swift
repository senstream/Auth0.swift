// swift-tools-version:5.9

import PackageDescription

let webAuthPlatforms: [Platform] = [.iOS, .macOS, .macCatalyst, .visionOS]
let swiftSettings: [SwiftSetting] = [.define("WEB_AUTH_PLATFORM", .when(platforms: webAuthPlatforms))]

let package = Package(
    name: "Auth0",
    platforms: [.iOS(.v13), .macOS(.v11), .tvOS(.v13), .watchOS(.v7), .visionOS(.v1)],
    products: [.library(name: "Auth0", targets: ["Auth0"])],
    dependencies: [
        .package(url: "https://github.com/senstream/JWTDecode.swift.git", revision: "4693ade2d52fa7181d720dce7f0b43783199f904"),
        .package(url: "https://github.com/senstream/SimpleKeychain", revision: "e92751e93c81b90fa0a82e98be245e6251f8ec2a"),
    ],
    targets: [
        .target(
            name: "Auth0", 
            dependencies: [
                .product(name: "JWTDecode", package: "JWTDecode.swift"),
                .product(name: "SimpleKeychain", package: "SimpleKeychain")
            ],
            path: "Auth0",
            exclude: ["Info.plist"],
            swiftSettings: swiftSettings),
    ]
)
