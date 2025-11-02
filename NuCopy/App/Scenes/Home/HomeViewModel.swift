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
                imageSystemName: "person.crop.circle",
                onEyeTapped: { print("eye tapped") },
                onHelpTapped: { print("help tapped") },
                onVerifyTapped: { print("verify tapped") }
            )
        ),
        .name(
            NameCellModel(username: "John Doe")
        ),
        .account(
            AccountCellModel(
                titleLabel: "Conta",
                chevronSystemName: "chevron.right",
                descriptionLabel: "Uma conta completa, com função débito, sem tarifa de manutenção e que faz seu dinheiro render.",
                buttonLabel: "Conhecer"
            )
        )
    ]
    
    func numberOfRows() -> Int {
        return items.count
    }
    
    func cellModelForRow(at indexPath: Int) -> HomeCell {
        return items[indexPath]
    }
}
