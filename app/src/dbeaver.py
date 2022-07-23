import pyautogui as pg
from mail import EmailSender
import time


if __name__ == "__main__":

    emails = ['natan@natanascimento.com']

    for email in emails:
        user = email.split("@")[0]
        nome = user.split("_")[0].capitalize()
        password = ""
        server_ip = ""
        server_port = 8978

        time.sleep(2)
        #Click Add
        time.sleep(1)
        pg.click(310, 218)
        time.sleep(2)
        #Click User Name
        time.sleep(1)
        pg.click(340, 562)
        time.sleep(2)
        pg.write(user)
        #Click pass
        time.sleep(1)
        pg.click(340, 653)
        time.sleep(2)
        pg.write(password)
        #Click repeat pass
        time.sleep(1)
        pg.click(340, 760)
        time.sleep(2)
        pg.write(password)
        #Click user role
        time.sleep(2)
        pg.click(736, 653)
        #Click create
        time.sleep(2)
        pg.click(1810, 381)
        time.sleep(5)

        message = f"""
            Olá {nome}, 

            Aqui está o seu acesso ao ambiente SQL na Cloud.

            Para acessar o ambiente, utilize a url http://{server_ip}:{server_port}/.

            Após acessar o DBeaver, insira o login e senha informado abaixo:

            Login: {user}
            Senha: {password}

            Divirta-se :)

            Muito Obrigado! Até mais!
        """

        EmailSender().send(email, message)

        print(f"{nome} foi cadastrado no dbeaver!")
