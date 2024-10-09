//
//  ArrayFunctionsTests.swift
//  WExerciseTests
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import XCTest
import WExercise

final class ArrayFunctionsTests: XCTestCase {

    var functions: ArrayFunctionsType?
    
    override func setUpWithError() throws {
        functions = ArrayFunctions()
    }

    override func tearDownWithError() throws {
        functions = nil
    }

    func testGetSumList() throws {
        let randomList = functions?.makeList() ?? []
        print("random list \(randomList) \n")
        let sum = functions?.getSum(input: randomList)
        print("sum \(sum)")
        XCTAssertNotNil(sum)
    }
}
