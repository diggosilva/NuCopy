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
        .paymentAssistent(
            PaymentAssistantCellModel(
                titleLabel: "Planeje suas contas",
                chevronSystemName: SFSymbols.chevronRight,
                descriptionLabel: "Acompanhe, pague e programe com a ajuda do Assistente de pagamentos.",
                buttonLabel: "Acessar"
            )
        ),
        .divider(
            DividerCellModel.init()
        ),
        .discover(
            DiscoverCardCellModel(
                titleLabel: "Descubra mais",
                items: [
                    DiscoverCardItemModel(
                        namedImage: "menoresDe18",
                        title: "Conta pra Menores de 18",
                        description: "Solicite a conta para seus filhos a partir de 6 anos.",
                        titleButton: "Começar"
                    ),
                    DiscoverCardItemModel(
                        namedImage: "seguroVida",
                        title: "Seguro Vida",
                        description: "Cuide de quem você ama de um jeito simples e que cabe no seu bolso.",
                        titleButton: "Conhecer"
                    ),
                    DiscoverCardItemModel(
                        namedImage: "nuSeguro",
                        title: "Área de Seguros do Nu",
                        description: "Toda proteção para você e para quem você ama num só lugar.",
                        titleButton: "Conhecer"
                    ),
                    DiscoverCardItemModel(
                        namedImage: "indiqueAmigos",
                        title: "Indique Nu para os amigos",
                        description: "Espalhe como é simples estar no controle.",
                        titleButton: "Conhecer"
                    ),
                    DiscoverCardItemModel(
                        namedImage: "portabilidadeSalario",
                        title: "Portabilidade de salário",
                        description: "Liberdade é escolher onde receber seu dinheiro.",
                        titleButton: "Conhecer"
                    ),
                    DiscoverCardItemModel(
                        namedImage: "applePay",
                        title: "Apple Pay",
                        description: "Deixe a carteira em casa e pague com cartão usando só o seu iPhone.",
                        titleButton: "Conhecer mais"
                    ),
                    DiscoverCardItemModel(
                        namedImage: "nuCel",
                        title: "Chegou NuCel",
                        description: "A experiência NuBank, agora em planos de celular.",
                        titleButton: "Conhecer"
                    ),
                    DiscoverCardItemModel(
                        namedImage: "nuBankPredio",
                        title: "Termos de uso",
                        description: "Explicamos o que diz esse documento do NuBank",
                        titleButton: "Conhecer"
                    )
                ]
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
