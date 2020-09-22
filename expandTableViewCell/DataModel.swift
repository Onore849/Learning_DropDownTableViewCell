//
//  DataModel.swift
//  expandTableViewCell
//
//  Created by 野澤拓己 on 2020/09/18.
//

import Foundation

class DataModel {
    
    var number: Int?
    var headerName: String?
    var subTypes: [String]?
    var isExpandable: Bool = false
    
    init(number: Int, headerName: String, subTypes: [String] , isExpandable: Bool) {
        self.number = number
        self.headerName = headerName
        self.subTypes = subTypes
        self.isExpandable = isExpandable
    }
    
}
