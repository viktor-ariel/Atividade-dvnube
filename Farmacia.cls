public with sharing class Farmacia {
    public Estoque est;
    public CatalogoPreco cp;
    public String nome;
    public String cidade;
   

    public Farmacia(String nome, String cidade, Estoque est, CatalogoPreco cp) {
        this.nome = nome;
        this.cidade = cidade;
        this.est = est;
        this.cp = cp;
    }
	
    
    public Pedido gerarPedido(List<Produto> produtos, String cliente) {
        Pedido p = new Pedido(cliente);
        
        for (Produto prod : produtos) {
            if (est.temEmEstoque(prod, 1)) {
                addProduto(p, prod, 1);
                p.setValorTotal(cp.getPreco(prod));
            } else {
                System.debug('Não tem no estoque: '+ prod.nome );
            }
        }
        //verificar estoque, preço do catálogo tem que bater
        //verificar se tem produto em estoque
        //se tem, decrementar 1 do estoque
        //se não tem, System.debug('Produto em falta: ' + produto.Name);
        //gerar um pedido, com valor total
        return p;
    }
    

    private void addProduto(Pedido ped, Produto prod, Integer qtd) {
        ped.addProduto(prod.nome, qtd);
        est.decrementar(prod, qtd);
    }
}