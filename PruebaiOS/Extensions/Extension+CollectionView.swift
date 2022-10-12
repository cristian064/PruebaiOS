//
//  Base.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 12/10/22.
//

import UIKit

public extension UICollectionViewCell{
    static var cellIdentifier : String {
        return "\(String(describing: self))Identifier"
    }
}

public extension UICollectionReusableView {
    static var headerIdentifier : String{
        return "\(String(describing: self))Identifier"
    }
    static var footerIdentifier : String{
        return "\(String(describing: self))Identifier"
    }
}


public protocol ReuseIdentifier: AnyObject {
}

public extension ReuseIdentifier {
    static var reuseIdentifier: String {
        return "\(String(describing: self))Identifier"
    }
}
