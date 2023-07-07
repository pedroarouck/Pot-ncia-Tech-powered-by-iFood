menu = """

[d] Depositar
[s] Sacar
[e] Extrato
[q] Sair

=> """

saldo = 0
limite = 500
extrato = ""
numero_saques = 0
LIMITE_SAQUES = 3

while True:

    opcao = input(menu)

    if opcao == "d":
        valor =input("Informe o valor do depósito: ")
        
        if valor.isdigit():
            valor = float(valor)
            if valor > 0:
                saldo += valor
                extrato +="Depósito: R${:.2f}\n".format(valor)
        else:
            print("Operação falhou! O valor informado é inválido")

    elif opcao == "s":
        valor = input("Informe o valor do saque: ")
        if valor.isdigit():
            valor = float(valor)
            excedeu_saldo = valor > saldo
            excedeu_limite = valor > limite
            excedeu_saques = numero_saques >= LIMITE_SAQUES

            if excedeu_saldo:
                print("Operação falhou! Você não tem saldo suficiente.")

            elif excedeu_limite:
                print("Operação falhou! Você não tem saldo suficiente")

            elif excedeu_saques:
                print("Operação falhou! Número máximo de saques excedido.")

            elif valor > 0:
                saldo -= valor
                extrato +="Saque: R${:.2f}\n".format(valor)
                numero_saques += 1

        else:
            print("Operação falhou! O valor informado é inválido")

    elif opcao == "e":
        print("Extrato\n")
        print("Não foram realizadas movimentações." if not extrato else extrato)
        print("Saldo: R${:.2f}\n".format(saldo))
        print("Fim Extrato")

    elif opcao == "q":
        break

    else:
        print("Operação inválida, por favor selecione novamente a operação desejada")