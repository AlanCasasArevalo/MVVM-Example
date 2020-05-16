//
//  WebService.swift
//  MVVMTest1
//
//  Created by Alan Casas on 16/05/2020.
//  Copyright © 2020 Alan Casas. All rights reserved.
//

import Foundation

class WebService {
    var dataArray: [ListModel]?
    func performDataListModel (successCompletion: @escaping ([ListModel]?) -> (), errorCompletion: @escaping (Error?) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let decoder = JSONDecoder()
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if error != nil {
                print("Errorrrrrr: \(error?.localizedDescription ?? "")")
                errorCompletion(error)
            } else {
                guard let dataDes = data else { return }
                // serializacion de los datos
                self?.dataArray = try! decoder.decode([ListModel].self, from: dataDes)
                successCompletion(self?.dataArray)
            }
        }.resume()
    }
}
