<?php
require 'db.php';

$resultadoReceitas = mysqli_query($conexao, "SELECT SUM(t. valor) as totalReceita
FROM transacoes t INNER JOIN categorias c ON t.categoria_id = c.id WHERE c.tipo = 'receita' AND MONTH(t.data) = 4 AND YEAR(t.data) = 2025;");
$valorReceita = mysqli_fetch_assoc($resultadoReceitas);

$resultadoDespesas = mysqli_query($conexao, "SELECT SUM(t. valor) as totalDespesas FROM transacoes t INNER JOIN categorias c ON t.categoria_id = c.id WHERE c.tipo = 'despesa' AND MONTH(t.data) = 4 AND YEAR(t.data) = 2025");
$valorDespesa =  mysqli_fetch_assoc($resultadoDespesas);

$relacaoReceita = mysqli_query($conexao, "SELECT SUM(t. valor) as antigoR FROM transacoes t INNER JOIN categorias c ON t.categoria_id = c.id WHERE c.tipo = 'receita' AND MONTH(t.data) = 3 AND YEAR(t.data) = 2025");
$paraleloReceita = mysqli_fetch_assoc($relacaoReceita);


$relacaoDespesa = mysqli_query($conexao, "SELECT SUM(t.valor) as antigoD FROM transacoes t INNER JOIN categorias c ON t.categoria_id = c.id WHERE c.tipo = 'despesa' AND MONTH(t.data) = 3 AND YEAR(t.data) = 2025");
$paraleloDespesa = mysqli_fetch_assoc($relacaoDespesa);

$dados = [
    "receitas" => $valorReceita['totalReceita'],
    "despesas" => $valorDespesa['totalDespesas'],
    "receitaAnterior" => $paraleloReceita['antigoR'],
    "despesaAnterior" => $paraleloDespesa['antigoD']
];

echo json_encode($dados);
?>