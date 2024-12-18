/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest
@testable import ScoopsAndScones

class CreateIceCreamInteractorTests: XCTestCase {
  // swiftlint:disable implicitly_unwrapped_optional
  var sut: CreateIceCreamInteractor!
  var presenterSpy: CreateIceCreamPresenterSpy!
  // swiftlint:enable implicitly_unwrapped_optional

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = CreateIceCreamInteractor()
    presenterSpy = CreateIceCreamPresenterSpy()
  }

  // MARK: - Test doubles
  
  class CreateIceCreamPresenterSpy: CreateIceCreamPresentationLogic {
    var iceCream: IceCream?
    var presentIceCreamCalled = false

    func presentIceCream(response: CreateIceCream.LoadIceCream.Response) {
      presentIceCreamCalled = true
      iceCream = response.iceCreamData
    }
  }

  // MARK: - Tests
  
  func testLoadIceCreamCallsPresenterToPresentIceCream() {
    // Given: assign the presenter spy to your presenter and create iceCream data using the seed data
    sut.presenter = presenterSpy
    let iceCream = Seeds.iceCream
    // When: create a request and execute loadIceCream(request:)
    let request = CreateIceCream.LoadIceCream.Request()
    sut.loadIceCream(request: request)
    // Then: assert that data decoded from the json is the same data you’re sending to the presenter
    XCTAssertEqual(
      presenterSpy.iceCream,
      iceCream,
      "loadIceCream(request:) should ask the presenter to present the same ice cream data it loaded"
    )
  }

  override func tearDownWithError() throws {
    sut = nil
    presenterSpy = nil
    try super.tearDownWithError()
  }
}
