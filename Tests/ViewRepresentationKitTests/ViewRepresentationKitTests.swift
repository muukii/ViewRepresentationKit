import XCTest
import UIKit
@testable import ViewRepresentationKit

final class ViewRepresentationKitTests: XCTestCase {

  func testFrameCalculation() {

    let view = UIView()

    view.frame = .init(x: 20, y: 30, width: 40, height: 50)

    let representation = ViewRepresentation(from: view)

    XCTAssertEqual(view.frame, representation.frame)
  }

}
