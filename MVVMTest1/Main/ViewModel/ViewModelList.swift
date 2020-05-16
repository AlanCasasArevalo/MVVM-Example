//
//  ViewModelList.swift
//  MVVMTest1
//
//  Created by Alan Casas on 16/05/2020.
//  Copyright © 2020 Alan Casas. All rights reserved.
//

import Foundation

class ViewModelList {
    // Enlazar vista con modelo de la vista
    var updateData = { () -> () in }
    var webService = WebService()
    
    // Fuente de datos
    var dataArray: [ListModel] = [] {
        didSet{
            updateData()
        }
    }
    
    // OBTENER LOS DATOS DE LA API
    func performDataListModel () {
        webService.performDataListModel(successCompletion: { [weak self] (listModel) in
            guard let listDes = listModel else { return }
            self?.dataArray = listDes
        }) { (error) in
            guard let errorDes = error else { return }
        }
    }
    
}
