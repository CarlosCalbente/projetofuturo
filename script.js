async function carregarDados() {

     // ===================== BUSCAR OS DADOS =====================
    const resposta = await fetch('dados.php');
    const dados = await resposta.json();

    // ===================== PREENCHER OS CARTÕES PRINCIPAIS =====================
    document.getElementById('valor-receitas').textContent = dados.receitas;

}