//
//  CellCommonActionsDelegate.swift
//  NuCopy
//
//  Created by Diggo Silva on 02/11/25.
//

import Foundation

protocol CellCommonActionsDelegate: AnyObject {
    func didTapEyeButton(in cell: HeaderCell)
    func didTapHelpButton(in cell: HeaderCell)
    func didTapVerifyButton(in cell: HeaderCell)
    
    func didSelectShortcut(in cell: ShortcutTableCell, at indexPath: IndexPath)
}
