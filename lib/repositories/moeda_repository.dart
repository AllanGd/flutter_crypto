import 'package:flutter_crypto/models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
        icone: 'images/bitcoin.webp',
        nome: 'Bitcoin',
        sigla: 'BTC',
        preco: 30903.3),
    Moeda(
        icone: 'images/cardano.webp',
        nome: 'Cardano',
        sigla: 'ADA',
        preco: 2.2997),
    Moeda(
        icone: 'images/dogecoin.webp',
        nome: 'Dogecoin',
        sigla: 'DOGE',
        preco: 0.068598),
    Moeda(
        icone: 'images/ethereum.webp',
        nome: 'Ethereum',
        sigla: 'ETH',
        preco: 1905.23),
    Moeda(
        icone: 'images/litecoin.png',
        nome: 'Litecoin',
        sigla: 'LTC',
        preco: 92.030),
    Moeda(
        icone: 'images/polygon.webp',
        nome: 'Polygon',
        sigla: 'MATIC',
        preco: 0.685),
    Moeda(
        icone: 'images/solana.webp',
        nome: 'Solana',
        sigla: 'SOL',
        preco: 17.325),
    Moeda(
        icone: 'images/tron.webp', nome: 'TRON', sigla: 'TRX', preco: 0.073256),
    Moeda(icone: 'images/xrp.webp', nome: 'XRP', sigla: 'XRP', preco: 0.49844),
  ];
}
