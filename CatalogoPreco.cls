public with sharing class CatalogoPreco {
    public String nome;
    public Map<String, Decimal> mapProdutosPrecos;
    

    public CatalogoPreco(String nome) {
        this.nome = nome;
        mapProdutosPrecos = new Map<String, Decimal>();
    }
    public Decimal getPreco(Produto p ){
        if(mapProdutosPrecos.containsKey(p.nome)){
            return mapProdutosPrecos.get(p.nome);
        }else{
            return 0;
        }
    }
}