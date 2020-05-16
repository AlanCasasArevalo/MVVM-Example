//
//  ViewController.swift
//  MVVMTest1
//
//  Created by Alan Casas on 16/05/2020.
//  Copyright © 2020 Alan Casas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var postTableView: UITableView!
    let reusableCellIdentifier = "reusableCell"
    
    var viewModel = ViewModelList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindDataToView()
    }

    private func setupView () {
        startAnimationView()
        viewModel.performDataListModel()
    }
    
    private func bindDataToView () {
        viewModel.updateData = { [weak self] () in
            DispatchQueue.main.async {
                self?.postTableView.reloadData()
                self?.stopAnimationView()
            }
        }
    }
    
    func startAnimationView()  {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func stopAnimationView () {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCellIdentifier, for: indexPath)
        let model = viewModel.dataArray[indexPath.row]
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.body
        return cell
    }
        
}








