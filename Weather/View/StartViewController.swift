//
//  StartViewController.swift
//  Weather
//
//  Created by Iliya Kuznetsov on 03.11.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import UIKit

class StartViewController: UITableViewController {
    
    let segueIdenitifer = "ToDetailSegue"
    weak var viewModel: StartViewModel! {
        didSet {
            viewModel.updateWeather {
                self.tableView.reloadData()
            }
        }
    }
    let cellIdentifier = String(describing: CityTableViewCell.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func setupTableView() {
        self.tableView.register(UINib(nibName:cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView.rowHeight = 76
        self.tableView.estimatedRowHeight = 200
        self.tableView.contentInset.top = 20
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == segueIdenitifer,
            let detailController = segue.destination as? DetailViewController,
            let index = sender as? Int {
            detailController.viewModal = self.viewModel.detailsViewModel(index)
            }
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCities()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CityTableViewCell
        if cell == nil {
            cell = UINib(nibName: cellIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil).first as? CityTableViewCell
        }
        cell!.viewModel = self.viewModel.cellViewModel(indexPath.row)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: segueIdenitifer, sender: indexPath.row)
    }
}
