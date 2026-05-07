import Testing

@testable import supacode

struct SidebarRightArrowFocusPolicyTests {
  @Test func targetWorktreeRequiresSingleSidebarSelectionMatchingCurrentWorktree() {
    #expect(
      SidebarRightArrowFocusPolicy.targetWorktreeID(
        selectedWorktreeID: "/tmp/repo/main",
        sidebarSelectedWorktreeIDs: ["/tmp/repo/main"]
      ) == "/tmp/repo/main"
    )
  }

  @Test func targetWorktreeRejectsMultiSelectionAndMismatchedSelection() {
    #expect(
      SidebarRightArrowFocusPolicy.targetWorktreeID(
        selectedWorktreeID: "/tmp/repo/main",
        sidebarSelectedWorktreeIDs: ["/tmp/repo/main", "/tmp/repo/feature"]
      ) == nil
    )
    #expect(
      SidebarRightArrowFocusPolicy.targetWorktreeID(
        selectedWorktreeID: "/tmp/repo/main",
        sidebarSelectedWorktreeIDs: ["/tmp/repo/feature"]
      ) == nil
    )
    #expect(
      SidebarRightArrowFocusPolicy.targetWorktreeID(
        selectedWorktreeID: nil,
        sidebarSelectedWorktreeIDs: ["/tmp/repo/main"]
      ) == nil
    )
  }
}
