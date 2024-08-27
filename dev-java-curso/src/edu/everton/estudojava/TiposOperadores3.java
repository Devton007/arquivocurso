package edu.everton.estudojava;

public class TiposOperadores3 {

    public static void main(String[] args) {
        //relacionais
        int numero1 = 1;
        int numero2 = 2;

        boolean simNao = numero1 != numero2;

        System.out.println("numero Um é diferente do numero 2? " + simNao);

        //variação
        int numerox = 1;
        int numeroy = 2;

        boolean vF = numerox >= numeroy;

        System.out.println("numero x é maior ou igual ao y? " + vF);


        //variação --> em caso de objetos usar equals e não os operadores
        String nome1 = "Amanda";
        String nome2 = "Talita";

        System.out.println(nome1. equals(nome2));


    }
    
}
