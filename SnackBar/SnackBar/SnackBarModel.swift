//
//  SnackBarModel.swift
//  SnackBar
//
//  Created by Yunus Abubakarov on 08.02.2022.
//

import Foundation
import UIKit

struct SnackBarModel {
    enum IconType {
        case download
        case note
        case checkmark
        case error
        
        var icon: UIImage {
            switch self {
            case .checkmark:
                return UIImage(systemName: "checkmark.circle")!
            case .download:
                return UIImage(systemName: "arrow.down.circle")!
            case .note:
                return UIImage(systemName: "info.circle")!
            case .error:
                return UIImage(systemName: "xmark.octagon")!
            }
        }
    }
    enum ButtonType {
        case long
        case short
    }
    // MARK: - Public properties
    var title: String
    var icon: UIImage?
    var buttonTitle: String?
    var buttonType: ButtonType? {
        return .short //TODO: - можно прописать условие по которому будем определять дляная или короткая кнопка
    }
    // MARK: - Constructor
    init(iconType: IconType? = nil, title: String, buttonTittle: String? = nil) {
        self.title = title
        self.icon = iconType?.icon
        self.buttonTitle = buttonTittle
    }
}
