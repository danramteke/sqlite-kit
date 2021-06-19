// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "sqlite-kit",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "SQLiteKit", targets: ["SQLiteKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/danramteke/sqlite-nio.git", .revision("df6caeb995bd70999d81a787a6e98b26cf734e8f")),
        .package(url: "https://github.com/vapor/sql-kit.git", from: "3.9.0"),
        .package(url: "https://github.com/vapor/async-kit.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "SQLiteKit", dependencies: [
            .product(name: "AsyncKit", package: "async-kit"),
            .product(name: "SQLiteNIO", package: "sqlite-nio"),
            .product(name: "SQLKit", package: "sql-kit"),
        ]),
        .testTarget(name: "SQLiteKitTests", dependencies: [
            .product(name: "SQLKitBenchmark", package: "sql-kit"),
            .target(name: "SQLiteKit"),
        ]),
    ]
)
