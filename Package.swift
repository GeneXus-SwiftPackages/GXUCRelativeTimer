// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXUCRelativeTimer",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXUCRelativeTimer",
			targets: ["GXUCRelativeTimerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.1.0-rc.5")
	],
	targets: [
		.target(name: "GXUCRelativeTimerWrapper",
				dependencies: [
					"GXUCRelativeTimer",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.watchOS, .tvOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCRelativeTimer",
			url: "https://pkgs.genexus.dev/iOS/preview/GXUCRelativeTimer-1.1.0-rc.5.xcframework.zip",
			checksum: "ce339babee2947874962fb5113c6d52d852af433e50f39b89612991a56b9580b"
		)
	]
)