//
//  MockRepository.swift
//  artic
//
//  Created by roland.michelberger on 20.07.23.
//

final class MockRepository: Repository {

    private let hasDelay: Bool
    private let delay: UInt64 = 500_000_000

    init(hasDelay: Bool = false) {
        self.hasDelay = hasDelay
    }
    
    func getArtList() async throws -> [Art] {
        if hasDelay {
            try await Task.sleep(nanoseconds: delay)
        }
        return [
            Art(
                id: 8360,
                title: "Te burao (The Hibiscus Tree)",
                dateDisplay: "1892",
                placeOfOrigin: "France",
                mediumDisplay: "Oil on cotton canvas",
                artistTitle: "Paul Gauguin",
                imageId: "604fe021-6008-f666-bce8-456b2fdc9bd4",
                publicationHistory: nil),
            Art(
                id: 11434,
                title: "Salome with the Head of Saint John the Baptist",
                dateDisplay: "c. 1639–42",
                placeOfOrigin: "Italy",
                mediumDisplay: "Oil on cotton canvas",
                artistTitle: "Guido Reni",
                imageId: "1f5b595f-dbbd-3c9d-ca49-9263c3d93841",
                publicationHistory: nil),
            Art(
                id: 11723,
                title: "Woman at Her Toilette",
                dateDisplay: "1875/80",
                placeOfOrigin: "France",
                mediumDisplay: "Oil on cotton canvas",
                artistTitle: "Berthe Morisot",
                imageId: "78c80988-6524-cec7-c661-a4c0a706d06f",
                publicationHistory: nil),
        ]
    }
    
    func getArtDetail(id: Int) async throws -> ArtDetail {
        if hasDelay {
            try await Task.sleep(nanoseconds: delay)
        }
        return ArtDetail(
            id: 65479,
            title: "Cottages with a Woman Working in the Middle Ground",
            dateDisplay: "1890",
            placeOfOrigin: "Netherlands",
            mediumDisplay: "Charcoal, reed pen and black ink, blue pastel, and white chalk on blue-gray laid paper",
            artistDisplay: "Vincent van Gogh\nDutch, 1853-1890",
            imageId: "c60f377f-37e3-a5e5-6a49-2099fb475355",
            publicationHistory: "J. B. De la Faille, L'Oeuvre de Vincent Van Gogh (Brussels and Paris, 1928), p. 178, no. 1642, pl. CCIX.\n\nJ. B. de la Faille, The Works of Vincent van Gogh: His Paintings and Drawings (Amsterdam, 1970), p. 560, no. 1642 (ill.).\n\nJan Hulsker, The Complete Van Gogh: Paintings, Drawings, Sketches (New York, 1980), no. 1994 (ill.).\n\nJ. E. Hijbroek and E.L. Wouthuysen, Kunst, Kennis en Commercis: De Kunsthandelaar J.H. de Bois, 1878-1946 (Amsterdam, 1993), p. 206.\n\nBelinda Thomson, Van Gogh (Chicago, 2001), pp. 81,  102, and 107, pl. 15.",
            styleTitle: nil)
    }
}
