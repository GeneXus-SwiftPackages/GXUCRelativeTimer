// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXUCRelativeTimer",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXUCRelativeTimer",
			targets: ["GXUCRelativeTimerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.5.0-beta.17")
	],
	targets: [
		.target(name: "GXUCRelativeTimerWrapper",
				dependencies: [
					"GXUCRelativeTimer",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCRelativeTimer",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCRelativeTimer-1.5.0-beta.17.xcframework.zip",
			checksum: "92e9a19fa19da2e14ae9f7086a89be5e77261aabb1014405cca9cfa5f7b26865"
		)
	]
)