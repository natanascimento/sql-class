import pyautogui as pg
from mail import EmailSender
import time

emails = ['natanascimento@natanascimento.com']

for email in emails:
    user = email.split("@")[0]
    nome = user.split(".")[0].capitalize()
    password = "senai2022"

    time.sleep(2)
    #Click Add
    pg.click(238, -851)
    time.sleep(2)
    #Click User Name
    pg.click(281, -518)
    time.sleep(2)
    pg.write(user)
    #Click pass
    pg.click(263, -419)
    time.sleep(2)
    pg.write(password)
    #Click repeat pass
    pg.click(263, -319)
    time.sleep(2)
    pg.write(password)
    #Click user role
    time.sleep(2)
    pg.click(658, -419)
    #Click create
    time.sleep(2)
    pg.click(1740, -690)
    time.sleep(5)

    message = f"""
        Olá {nome}, 

        Aqui está o seu acesso ao ambiente SQL na Cloud.

        Para acessar o ambiente, utilize a url http://0.0.0.0:8978/.

        Após acessar o DBeaver, insira o login e senha informado abaixo:

        Login: {user}
        Senha: {password}

        Divirta-se :)

        Muito Obrigado! Até mais! 
    """

    EmailSender().send(email, message)

    print(f"{nome} foi cadastrado no dbeaver!")
