import XCTest
import Moya
import PromiseKit

@testable import BIOSTask

final class BIOSTaskTests: XCTestCase {
    
    // Variables
    private let gameService = MoyaProvider<GameService>()
    private let loading = BGLoading()
    private var parameters: [String: String] = [:]
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        parameters.updateValue("epic-games-store", forKey: "platform")
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // First API Test
    func firstAPITest() throws {
        try getGameDataAPI(parameters: [:])
    }
    
    func getGameDataAPI(parameters: [String: String]) throws {
        firstly {
            () -> Promise<Any> in
            loading.showLoading()
            return BGServices.manger.CallApi(self.gameService, GameService.GetGameData(paramters: [:]))
        }.done { response in
            let result = response as! Response
            guard BGNetworkHelper.validateResponse(response: result) else { return }
            let response: [GameModel] = try BGDecoder.decode(data: result.data)
            
            // Test Comes Here
            XCTAssertNotNil(response, "There's no response from the server")
            
        }.ensure { [weak self] in
            guard let self = self else { return }
            self.loading.dismissLoading()
        }.catch { error in
            print(error)
        }
    }
    
    // Second API Test
    func secondAPITest() throws {
        try getGameDataByPlatFormAPI(parameters: parameters)
    }
    
    func getGameDataByPlatFormAPI(parameters: [String: String]) throws {
        firstly {
            () -> Promise<Any> in
            loading.showLoading()
            return BGServices.manger.CallApi(self.gameService, GameService.GetGameData(paramters: parameters))
        }.done { response in
            let result = response as! Response
            guard BGNetworkHelper.validateResponse(response: result) else { return }
            let response: [GameModel] = try BGDecoder.decode(data: result.data)
            
            // Test Comes Here
            XCTAssertNotNil(response, "There's no response from the server")
            
        }.ensure { [weak self] in
            guard let self = self else { return }
            self.loading.dismissLoading()
        }.catch { error in
            print(error)
        }
    }
    
    // Performance Test
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        do {
            try firstAPITest()
            try secondAPITest()
        } catch {
            XCTFail("Setup failed with error: \(error)")
        }
        
        // Measure performance
        self.measure {
            // Perform the same tests without throwing
            _ = try? firstAPITest()
            _ = try? secondAPITest()
        }
    }
}
