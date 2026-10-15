async function carregarDados() {

     // ===================== BUSCAR OS DADOS =====================
    const resposta = await fetch('dados.php');
    const dados = await resposta.json();

    // ===================== PREENCHER OS CARTÕES PRINCIPAIS =====================
    document.getElementById('valor-receitas').textContent = dados.receitas;
    document.getElementById('valor-despesas').textContent = dados.despesas;

    const saldo = dados.receitas - dados.despesas;
    document.getElementById('valor-saldo').textContent = saldo;
    
    const variacaoReceitas =  Math.round(((dados.receitas - dados.receitaAnterior) / dados.receitaAnterior ) * 100);

    const simboloR = variacaoReceitas >= 0 ? "▲" : "▼";
    const corR = variacaoReceitas >= 0 ? "var(--green)" : "var(--red)";

    document.getElementById('anteriorR').textContent =  simboloR + " " + variacaoReceitas + "% em relação ao mês anterior";
    
    document.getElementById('anteriorR').style.color = corR

    const variacaoDespesa = Math.round(((dados.despesas - dados.despesaAnterior)/ dados.despesaAnterior)*100);
    const simboloD = variacaoDespesa >= 0 ? "▲" : "▼";
    const corD = variacaoDespesa >= 0 ? "var(--green)" : "var(--red)";

    document.getElementById('anteriorD').textContent =  simboloD + " " + variacaoDespesa + "% em relação ao mês anterior";
    document.getElementById('anteriorD').style.color = corD

    const saldoAnterior = dados.receitaAnterior - dados.despesaAnterior;
    const variacaoSaldo = Math.round(((saldo - saldoAnterior) / saldoAnterior)*100)
    const simboloS = variacaoSaldo >= 0 ? "▲" : "▼";
    const corS = variacaoSaldo >= 0 ? "var(--green)" : "var(--red)"; 
    document.getElementById('anteriorV').style.color = corS
    document.getElementById('anteriorV').textContent = simboloS + " " + saldoAnterior + "% em relação ao mês anterior";


        console.log(dados);
        console.log(saldo);


}
carregarDados();