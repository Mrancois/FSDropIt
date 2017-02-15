import PackageDescription

let package = Package(
    name: "FSDropIt",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/Mrancois/FSDropIt", majorVersion: 2)
    ]
)
