//
//  HomeViewModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 02/11/25.
//

import Foundation

protocol HomeViewModelProtocol {
    func numberOfRows() -> Int
    func cellModelForRow(at indexPath: Int) -> HomeCell
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private let items: [HomeCell] = [
        .header(
            HeaderCellModel(
                imageSystemName: SFSymbols.profileImage
            )
        ),
        .name(
            NameCellModel(username: "John")
        ),
        .account(
            AccountCellModel(
                titleLabel: "Conta",
                chevronSystemName: SFSymbols.chevronRight,
                descriptionLabel: "Uma conta completa, com função débito, sem tarifa de manutenção e que faz seu dinheiro render.",
                buttonLabel: "Conhecer"
            )
        ),
        .shortcuts(
            ShortcutCellModel(shortcuts: [
                ShortcutItemModel(imageName: SFSymbols.squareGrid2x2, title: "Área Pix e Transferir"),
                ShortcutItemModel(imageName: SFSymbols.barcode, title: "Pagar"),
                ShortcutItemModel(imageName: SFSymbols.dollarSign, title: "Pegar emprestado"),
                ShortcutItemModel(imageName: SFSymbols.smartphone, title: "Recarga de celular"),
            ])
        )
    ]
    
    func numberOfRows() -> Int {
        return items.count
    }
    
    func cellModelForRow(at indexPath: Int) -> HomeCell {
        return items[indexPath]
    }
}
