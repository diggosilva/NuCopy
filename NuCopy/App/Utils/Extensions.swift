//
//  Extensions.swift
//  NuCopy
//
//  Created by Diggo Silva on 31/10/25.
//

import UIKit

extension UIColor {
    static let roxinho = #colorLiteral(red: 0.5099446177, green: 0.03479245678, blue: 0.8188650012, alpha: 1)
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

extension String {
    /// Converte a string usando a sintaxe de asterisco (*texto*) para formatar partes em negrito.
    /// - Parameters:
    ///   - baseFontSize: O tamanho da fonte base.
    ///   - baseFontWeight: O peso da fonte base (normal).
    ///   - boldFontWeight: O peso da fonte para o texto entre asteriscos.
    /// - Returns: Um NSAttributedString formatado.
    func toAttributedString(
        baseFontSize: CGFloat = 15,
        baseFontWeight: UIFont.Weight = .regular,
        boldFontWeight: UIFont.Weight = .semibold
    ) -> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: self)
        
        // Define os atributos básicos (parte normal)
        let baseAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: baseFontSize, weight: baseFontWeight),
            .foregroundColor: UIColor.label
        ]
        
        // Define os atributos para a parte em negrito
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: baseFontSize, weight: boldFontWeight),
            .foregroundColor: UIColor.label
        ]
        
        // Aplica os atributos básicos em toda a string
        attributedString.addAttributes(baseAttributes, range: NSRange(location: 0, length: attributedString.length))
        
        // Expressão Regular para encontrar o texto entre *asteriscos*
        let regex = try! NSRegularExpression(pattern: "\\*([^*]+)\\*", options: [])
        let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
        
        // Armazena as substituições a serem feitas
        var replacements: [(range: NSRange, text: String)] = []
        
        for match in matches.reversed() {
            // 1. Aplica o estilo negrito no range completo (incluindo os asteriscos)
            attributedString.addAttributes(boldAttributes, range: match.range)
            
            // 2. Extrai o texto dentro dos asteriscos (grupo de captura 1)
            let contentRange = match.range(at: 1)
            let content = (self as NSString).substring(with: contentRange)
            
            // 3. Marca para substituir a string original (*texto*) pelo conteúdo formatado (texto)
            replacements.append((range: match.range, text: content))
        }
        
        // 4. Substitui o texto completo (*texto*) apenas pelo conteúdo (texto)
        // Isso remove os asteriscos após a formatação ser aplicada.
        for replacement in replacements {
            attributedString.replaceCharacters(in: replacement.range, with: replacement.text)
        }
        
        return attributedString
    }
}
