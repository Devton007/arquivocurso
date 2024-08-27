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

       String resultados = x==y ? "verdade" : "mentira";

       System.out.println(resultados);

       //não se limita somente para string
       int c, d;

         c = 5;
         d = 6;

       int resultadoo = c==d ? 1 : 2;
       System.out.println(resultadoo);


        
    }
      
}
