package edu.everton.estudojava;
public class TiposOperadores2 {

    public static void main(String[] args) {

        // classe Operadores.java
        int a, b;

          a = 5;
          b = 5;

        String resultado = "";
        if (a==b)
        resultado = "verdadeiro";
        else
        resultado = "falso";
         System.out.println(resultado);

         //agora usando condição ternária
         int x, y;

         x = 5;
         y = 6;

       String resultados = a==b ? "verdade" : "mentira";

       System.out.println(resultados);

        
    }
      
}
