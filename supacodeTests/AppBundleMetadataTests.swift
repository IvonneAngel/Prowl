import Foundation
import Testing

struct AppBundleMetadataTests {
  @Test func appInfoPlistDeclaresAssetCatalogIconName() throws {
    let testsDirectory = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
    let infoPlistURL =
      testsDirectory
      .deletingLastPathComponent()
      .appending(path: "supacode/Info.plist")
    let plistData = try Data(contentsOf: infoPlistURL)
    let plist = try #require(
      PropertyListSerialization.propertyList(from: plistData, format: nil) as? [String: Any]
    )

    #expect(plist["CFBundleIconName"] as? String == "AppIcon")
  }
}
