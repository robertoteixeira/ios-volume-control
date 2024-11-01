//
//  VolumeControlViewModelTests.swift
//  VolumeControlTests
//
//  Created by Roberto Teixeira on 01/11/2024.
//

import XCTest
@testable import VolumeControl

class VolumeControlViewModelTests: XCTestCase {
    var viewModel: VolumeControlViewModel!

    override func setUp() {
        super.setUp()
        viewModel = VolumeControlViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testSetBarCountValid() {
        viewModel.inputBarCount = "15"
        viewModel.setBarCount()
        XCTAssertEqual(viewModel.barCount, 15)
        XCTAssertTrue(viewModel.errorMessage.isEmpty)
    }

    func testSetBarCountInvalid() {
        viewModel.inputBarCount = "0"
        viewModel.setBarCount()
        XCTAssertEqual(viewModel.barCount, 10) // Assuming default value
        XCTAssertEqual(viewModel.errorMessage, "Bar count must be between 4 and 30.")
    }

    func testSetVolumeValid() {
        viewModel.inputProgress = "50"
        viewModel.setVolume()
        XCTAssertEqual(viewModel.sliderProgress, 0.5)
        XCTAssertTrue(viewModel.errorMessage.isEmpty)
    }

    func testSetVolumeInvalid() {
        viewModel.inputProgress = "150"
        viewModel.setVolume()
        XCTAssertEqual(viewModel.sliderProgress, 0.5) // Assuming it doesn’t change
        XCTAssertEqual(viewModel.errorMessage, "Progress must be between 0 and 100.")
    }
}
