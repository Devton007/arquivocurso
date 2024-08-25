package edu.everton.estudojava;

public class TiposOperadores {
    public static void main(String[] args) {
        String nomeCompleto = "ton " + "Ferreira";
		System.out.println(nomeCompleto);


		String meuNome = "Everton Ferreira";
		System.out.println(meuNome);

        int numero = 5;

        numero = - numero;

        numero = numero * -1;
        System.out.println(numero);

    
        int numeroNovo = 10;
        numeroNovo ++;
        // é a mesma coisa de numero = numero +1
        System.out.println(numeroNovo);

        int numeroo = 1;
        System.out.println(++ numeroo);

        int numerooo = 9;
        System.out.println(-- numerooo);

        boolean casado = true;
        System.out.println(! casado);

    }
    
}
