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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.2.0-beta.31")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCRelativeTimer-1.2.0-beta.31.xcframework.zip",
			checksum: "e6f77d080e74bd3815a373c89a155c19a1756a20e8cc55ed5501a2b3f44cd4d2"
		)
	]
)