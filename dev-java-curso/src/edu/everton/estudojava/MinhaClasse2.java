package edu.everton.estudojava;
public class MinhaClasse2 {

    public static void main(String[] args) {

        String primeiroNome = "Ton";
        String segundoNome = "Ferreira";

        String nomeCompleto = nomeCompleto(primeiroNome, segundoNome);
        System.out.println(nomeCompleto);
      
      }

      public static String nomeCompleto (String primeiroNome, String segundoNome) {
        return "Resultado do metodoo  " + primeiroNome.concat("  ").concat(segundoNome);

      }
      
     


}