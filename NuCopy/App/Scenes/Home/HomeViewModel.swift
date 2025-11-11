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
            HeaderCellModel(imageSystemName: SFSymbols.profileImage)
        ),
        .name(
            NameCellModel(username: "John")
        ),
        .account(
            AccountCellModel(
                titleLabel: "Conta",
                chevronSystemName: SFSymbols.chevronRight,
                descriptionLabel: "Uma conta completa, com função débito, sem tarifa de manutenção e que faz seu dinheiro render.",
                buttonLabel: "Conhecer")
        ),
        .shortcuts(
            ShortcutCellModel(shortcuts: [
                ShortcutItemModel(imageName: SFSymbols.squareGrid2x2, title: "Área Pix e Transferir", loanValue: nil),
                ShortcutItemModel(imageName: SFSymbols.barcode, title: "Pagar", loanValue: nil),
                ShortcutItemModel(imageName: SFSymbols.dollarSign, title: "Pegar emprestado", loanValue: "R$10.000"),
                ShortcutItemModel(imageName: SFSymbols.smartphone, title: "Recarga de celular", loanValue: nil),
            ])
        ),
        .extraMoney(
            ExtraMoneyCellModel(
                moneyImageSystemName: SFSymbols.banknote,
                titleLabel: "Dinheiro adicional",
                descriptionLabel: "Opções de crédito disponível",
                chevronSystemName: SFSymbols.chevronRight)
        ),
        .invite(
            InviteCardCellModel(inviteItems: [
                InviteItemModel(title: "*Facilite seus planos futuros:* guarde dinheiro nas Caixinhas", iconSystemName: SFSymbols.shippingbox),
                InviteItemModel(title: "Pague *boletos no crédito* em até 12x direto pelo app", iconSystemName: SFSymbols.listClipboard),
                InviteItemModel(title: "Adicione seu *cartão Nubank* nas carteiras digitais ", iconSystemName: SFSymbols.wallet)
            ])
        ),
        .divider(
            DividerCellModel.init()
        ),
        .creditCard(
            CreditCardCellModel(
                titleLabel: "Cartão de crédito",
                chevronSystemName: SFSymbols.chevronRight,
                currentInvoiceLabel: "Fatura atual",
                invoiceAmountLabel: "R$ 0,00",
                availableLimitLabel: "Limite disponível de R$ 3.000,00")
        ),
        .myCards(
            MyCardsCellModel(iconSystemName: SFSymbols.creditcard, title: "Meus cartões")
        ),
        .divider(
            DividerCellModel.init()
        ),
        .loan(
            LoanCellModel(
                titleLabel: "Empréstimo",
                chevronSystemName: SFSymbols.chevronRight,
                loanTitleLabel: "Valor disponível de até",
                loanAmountLabel: "R$ 10.000,00")
        ),
        .divider(
            DividerCellModel.init()
        ),
    ]
    
    func numberOfRows() -> Int {
        return items.count
    }
    
    func cellModelForRow(at indexPath: Int) -> HomeCell {
        return items[indexPath]
    }
}
