//
//  FavouriteMoviesViewController.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 02/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import UIKit

final class FavouriteMoviesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var dataSource: TableViewDataSource<MovieTableViewCell, MovieDetails>?
    private lazy var favouriteMoviesViewModel: FavouriteMoviesViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        favouriteMoviesViewModel = FavouriteMoviesViewModel(delegate: self)
        let favouriteMovieIDs = UserDefaults.standard.array(forKey: "favouriteMovieIDs") as? [String] ?? []
        favouriteMoviesViewModel?.getMovieDetailsData(iDs: favouriteMovieIDs)
        dataSource = TableViewDataSource(items: favouriteMoviesViewModel?.getMovies() ?? [], configureCell: { (cell, vm) in
            cell.configureCell(title: vm.title, imageUrl: vm.poster)
        })
        setupTableView()
        setupNavBar()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: MovieTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    private func setupNavBar() {
        navigationItem.title = "Favourite Movies"
    }
}

extension FavouriteMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 1.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = favouriteMoviesViewModel?.getMovie(index: indexPath.row)
        let vc: MovieDetailsViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        vc.movieId = vm?.id ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FavouriteMoviesViewController: FavouriteMoviesViewModelDelegate {
    func favouriteMoviesFetched() {
        dataSource?.updateItems(items: favouriteMoviesViewModel?.getMovies() ?? [])
        tableView.reloadData()
    }
}
