import java.util.Scanner;

class Cliente {
    private String nome;
    private String email;
    private String telefone;

    public Cliente(String nome, String email, String telefone) {
        this.nome = nome;
        this.email = email;
        this.telefone = telefone;
    }

    @Override
    public String toString() {
        return "Nome: " + nome + "\nE-mail: " + email + "\nTelefone: " + telefone;
    }
}

public class CadastroCliente {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite o nome do cliente: ");
        String nome = scanner.nextLine();

        System.out.print("Digite o e-mail do cliente: ");
        String email = scanner.nextLine();

        System.out.print("Digite o telefone do cliente: ");
        String telefone = scanner.nextLine();

        Cliente cliente = new Cliente(nome, email, telefone);
        System.out.println("\nCliente cadastrado com sucesso!");
        System.out.println(cliente);

        scanner.close();
    }
}
