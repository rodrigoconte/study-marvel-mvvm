//
//  HeroesListViewModel.swift
//  MVVMAppTest
//
//  Created by Rodrigo Conte on 25/02/24.
//

import Foundation

final class HeroesListViewModel: ObservableObject {
    // MARK: - Properties
    var heroesData: CharacterDataWrapperModel?
    
    @Published var heroesArray: [CharacterModel] = []
    
    // MARK: - Methods
    func getCharacters() async {
        let rest = RESTService<HeroesAPI>()
        do {
            heroesData = try await rest.request(.getHeroes)
            updateHeroesData()
        } catch RESTError.failedToCreateURL {
            print(RESTError.failedToCreateURL.errorDescription ?? "Unknow error")
        } catch RESTError.failedToFinishRequest {
            print(RESTError.failedToFinishRequest.errorDescription ?? "Unknow error")
        } catch RESTError.failedToDecodeResponse {
            print(RESTError.failedToDecodeResponse.errorDescription ?? "Unknow error")
        } catch {
            print("Unknow error")
        }
    }
    
    private func updateHeroesData() {
        if let results = heroesData?.data?.results {
            DispatchQueue.main.async {
                self.heroesArray = results
            }
        }
    }
}
