//
//  NuCopyTests.swift
//  NuCopyTests
//
//  Created by Diggo Silva on 19/11/25.
//

import XCTest
@testable import NuCopy

class HomeViewModelTests: XCTestCase {
    
    static let expectedItemsCount = 16
    
    var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testNumberOfRowsShouldReturnCorrectCount() {
        XCTAssertEqual(viewModel.numberOfRows(), Self.expectedItemsCount, "O número de células esperadas mudou.")
    }
    
    func testFirstCellShouldBeHeader() {
        let cell = viewModel.cellModelForRow(at: 0)
        
        switch cell {
        case .header(_):
            XCTAssertEqual(cell.cellIdentifier, "HeaderCell", "No identifier sempre uso o próprio nome da célula. Verifique.")
            
        default:
            XCTFail("A primeira célula não é do tipo HeaderCell.")
        }
    }
    
    func testSecondCellShouldBeHeader() {
        let cell = viewModel.cellModelForRow(at: 1)
        
        switch cell {
        case .name(let model):
            XCTAssertEqual(model.username, "John", "O nome de usuário deveria ser 'John'.")
            
        default:
            XCTFail("A segunda célula não é do tipo NameCell.")
        }
    }
    
    func testShortcutsCellShouldContainsFourItems() {
        let cell = viewModel.cellModelForRow(at: 3)
        
        switch cell {
        case .shortcuts(let model):
            XCTAssertEqual(model.shortcuts.count, 4)
            
        default:
            XCTFail("Esperado .shortcuts na posição 3")
        }
    }
    
    func testDiscoverCellShouldContainsEightItems() {
        let discoverIndex = 14
        let cell = viewModel.cellModelForRow(at: discoverIndex)
        
        switch cell {
        case .discover(let model):
            XCTAssertEqual(model.items.count, 8)
            
        default:
            XCTFail("Esperado .discover na posição 14")
        }
    }
}
