//
//  MovieProtocols.swift
//  MVPExample
//
//  Created by Christian Quicano on 1/31/22.
//

import Foundation

protocol MoviePresenterProtocol {
    func getMovies()
    func getTitle(by row: Int) -> String?
    func getOverview(by row: Int) -> String?
    func getImageData(by row: Int) -> Data?
    var rows: Int { get }
}

protocol MovieViewProtocol {
    func resfreshTableView()
    func displayError(_ message: String)
}
