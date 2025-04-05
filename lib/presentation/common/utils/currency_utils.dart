class CurrencyUtils {
  static List<String> currencyList = [
    "AUD", // Dólar Australiano
    "BGN", // Lev Búlgaro
    "BRL", // Real Brasileiro
    "CAD", // Dólar Canadense
    "CHF", // Franco Suíço
    "CNY", // Yuan Chinês
    "CZK", // Coroa Checa
    "DKK", // Coroa Dinamarquesa
    "EUR", // Euro
    "GBP", // Libra Esterlina
    "HKD", // Dólar de Hong Kong
    "HRK", // Kuna Croata
    "HUF", // Forint Húngaro
    "IDR", // Rupia Indonésia
    "ILS", // Novo Shekel Israelense
    "INR", // Rupia Indiana
    "ISK", // Coroa Islandesa
    "JPY", // Iene Japonês
    "KRW", // Won Sul-Coreano
    "MXN", // Peso Mexicano
    "MYR", // Ringgit Malaio
    "NOK", // Coroa Norueguesa
    "NZD", // Dólar Neozelandês
    "PHP", // Peso Filipino
    "PLN", // Złoty Polonês
    "RON", // Leu Romeno
    "RUB", // Rublo Russo
    "SEK", // Coroa Sueca
    "SGD", // Dólar de Singapura
    "THB", // Baht Tailandês
    "TRY", // Lira Turca
    "USD", // Dólar Americano
    "ZAR", // Rand Sul-Africano
  ];

  static Map<String, String> currencyToCountry = {
    "AUD": "AU", // Dólar Australiano → Austrália
    "BGN": "BG", // Lev Búlgaro → Bulgária
    "BRL": "BR", // Real Brasileiro → Brasil
    "CAD": "CA", // Dólar Canadense → Canadá
    "CHF": "CH", // Franco Suíço → Suíça
    "CNY": "CN", // Yuan Chinês → China
    "CZK": "CZ", // Coroa Checa → República Tcheca
    "DKK": "DK", // Coroa Dinamarquesa → Dinamarca
    "EUR": "DE", // Euro → Alemanha (mas usado em vários países da UE)
    "GBP": "GB", // Libra Esterlina → Reino Unido
    "HKD": "HK", // Dólar de Hong Kong → Hong Kong
    "HRK": "HR", // Kuna Croata → Croácia
    "HUF": "HU", // Forint Húngaro → Hungria
    "IDR": "ID", // Rupia Indonésia → Indonésia
    "ILS": "IL", // Novo Shekel Israelense → Israel
    "INR": "IN", // Rupia Indiana → Índia
    "ISK": "IS", // Coroa Islandesa → Islândia
    "JPY": "JP", // Iene Japonês → Japão
    "KRW": "KR", // Won Sul-Coreano → Coreia do Sul
    "MXN": "MX", // Peso Mexicano → México
    "MYR": "MY", // Ringgit Malaio → Malásia
    "NOK": "NO", // Coroa Norueguesa → Noruega
    "NZD": "NZ", // Dólar Neozelandês → Nova Zelândia
    "PHP": "PH", // Peso Filipino → Filipinas
    "PLN": "PL", // Złoty Polonês → Polônia
    "RON": "RO", // Leu Romeno → Romênia
    "RUB": "RU", // Rublo Russo → Rússia
    "SEK": "SE", // Coroa Sueca → Suécia
    "SGD": "SG", // Dólar de Singapura → Singapura
    "THB": "TH", // Baht Tailandês → Tailândia
    "TRY": "TR", // Lira Turca → Turquia
    "USD": "US", // Dólar Americano → Estados Unidos
    "ZAR": "ZA", // Rand Sul-Africano → África do Sul
  };

  static String getCountryCode({required String currencyCode}) {
    return currencyToCountry[currencyCode] ?? "Código não encontrado";
  }
}
