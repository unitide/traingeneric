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
    private var cache = [Int: Data]()
    var rows: Int {
        return movies.count
    }
    
    init(view: MovieViewProtocol, networkManager: NetworkManager = NetworkManager()) {
        self.view = view
        self.networkManager = networkManager
    }
    
    func getMovies() {
        let url = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=3&api_key=6622998c4ceac172a976a1136b204df4"
        
        networkManager.getMovies(from: url) { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies = response.results
                self?.downloadImages()
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
    
    func getTitle(by row: Int) -> String? {
        return movies[row].originalTitle
    }
    
    func getOverview(by row: Int) -> String? {
        return movies[row].overview
    }
    
    func getImageData(by row: Int) -> Data? {
        return cache[row]
    }
    
    private func downloadImages() {
        let baseImageURL = "https://image.tmdb.org/t/p/w500"
        let posterArray = movies.map { "\(baseImageURL)\($0.posterPath)" }
        
        let group = DispatchGroup()
        group.enter()
        for (index, url) in posterArray.enumerated() {
            networkManager.getImageData(from: url) { [weak self] data in
                if let data = data {
                    self?.cache[index] = data
                }
            }
        }
        group.leave()
        group.notify(queue: .main) { [weak self] in
            self?.view.resfreshTableView()
        }
    }
    
}
