//
//  MoviePresenter.swift
//  MVPExample
//
//  Created by Christian Quicano on 1/31/22.
//

import Foundation

class MoviePresenter: MoviePresenterProtocol {
    
    private let view: MovieViewProtocol
    private let networkManager: NetworkManager
    private var movies = [Movie]()
    var rows: Int {
        return movies.count
    }
    
    init(view: MovieViewProtocol, networkManager: NetworkManager = NetworkManager()) {
        self.view = view
        self.networkManager = networkManager
    }
    
    func getMovies() {
        let url = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=3&api_key=6622998c4ceac172a976a1136b204df4"
//        let url = ""
        
        networkManager.getMovies(from: url) { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies = response.results
                
                DispatchQueue.main.async {
                    self?.view.resfreshTableView()
                }
            case .failure(let error):
                
                DispatchQueue.main.async {
                    self?.view.displayError(error.localizedDescription)
                }
            }
        }
    }
    
}
