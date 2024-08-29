package edu.everton.estudojava;

public class UsuarioSmarttv {

    public static void main(String[] args) throws Exception {

        SmartTv smartTv= new SmartTv();



        //estado atual da tv
        System.out.println("Tv esta ligada? " + smartTv.ligada);
        System.out.println("Qual o volume? " + smartTv.volume);
        System.out.println("Qual o canal? " + smartTv.canal);

        smartTv.ligar ();
        System.out.println("status atual - Tv esta ligada? " + smartTv.ligada);

        smartTv.desligar();
        System.out.println("status atual - Tv esta ligada? " + smartTv.ligada);

        smartTv.diminuirVolume();
        smartTv.diminuirVolume();
        smartTv.diminuirVolume();
        smartTv.aumentarVolume();
        System.out.println("Volume atual TV "+ smartTv.volume);

        smartTv.subirCanal();
        smartTv.subirCanal();
        smartTv.subirCanal();
        System.out.println("Canal atual TV "+ smartTv.canal);

        smartTv.descerCanal();
        System.out.println("Canal atual TV "+ smartTv.canal);

        smartTv.escolherCanal(38);
        System.out.println("Canal atual TV "+ smartTv.canal);

        smartTv.descerCanal();
        System.out.println("Canal atual TV "+ smartTv.canal);
        
    }

   
    
}
