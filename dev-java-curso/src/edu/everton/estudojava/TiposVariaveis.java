package edu.everton.estudojava;

public class TiposVariaveis {
	public static void main(String[] args) {
		byte idade = 123;
		short ano = 2021;
		int cep = 21070333; // se começar com zero, talvez tenha que ser outro tipo
		long cpf = 98765432109L; // se começar com zero, talvez tenha que ser outro tipo
		float pi = 3.14F;
		double salario = 1275.33;

		int numero = 1;

		numero = 10;
		System.out.println(numero);

		final double VALOR_PI = 3.14;
		System.out.println(VALOR_PI);

		String nomeCompleto = "ton " + "Ferreira";
		System.out.println(nomeCompleto);


		String meuNome = "Everton Ferreira";
		System.out.println(meuNome);


	}
}
