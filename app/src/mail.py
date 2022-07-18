import os 
import smtplib
from email.message import EmailMessage


class EmailSender:

    # Configurar e-mail, senha
    __EMAIL_ADDRESS = ''
    __EMAIL_PASSWORD = ''

    @staticmethod
    def __create_message(to: str, content_message: str) -> EmailMessage:
        # Criar um e-mail
        message = EmailMessage()
        message["Subject"] = "[ConectaNuvem] Acesso ao ambiente SQL Cloud"
        message["From"] = EmailSender.__EMAIL_ADDRESS
        message["To"] = to
        message.set_content(content_message)

        return message

    def send(self, email: str, content_message: str) -> None:
        message = self.__create_message(email, content_message)
        with smtplib.SMTP_SSL("smtp.gmail.com", 465) as smtp:
            smtp.login(self.__EMAIL_ADDRESS, self.__EMAIL_PASSWORD)
            smtp.send_message(message)
        