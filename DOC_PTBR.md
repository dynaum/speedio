Documentação API
===


1. Obter o Auth Token
---
(precisa pegar apenas uma vez, e você pode usar esse token permanentemente)

http://servidor_address/tokens.json

Método POST com os seguintes dados no Body(form-data):

	user[username]: XXXX
	user[password]: XXXX

Resposta Json: Pega o valor do auth_token e utiliza no Passo 2

2. Enviar Mensagem
---

http://servidor_address/messages.json

Método POST com o seguinte header:

	HTTP-X-AUTH-TOKEN : seu auth_token

e com os seguintes dados no Body(form-data):

	message[to] : XXXX
	message[content]: XXXX


Resposta Json: Retornaremos o id da mensagem


3. Checar novas mensagens
---

http://servidor_address/messages.json?last_message_timestamp=XXXX&contact_number=XXXX

Método GET com o seguinte header:

HTTP-X-AUTH-TOKEN : seu auth_token


Resposta Json:

Iremos retornar todo o histórico de mensagens a partir de determinado timestamp
(caso não saiba, utilize 1)

E nessa resposta virá um timestamp


Dica:

a. Checa a mensagem novas mensagens (com timestamp=1), pega o timestamp
b. Envia mensagem para determinado numero
c. Fica em loop checando mensagens novas com o timestamp que foi pegado em 1 quando aparecer uma nova mensagem na resposta do json significa que a mensagem em b) foi respondida


4. Checar o status de uma mensagem específica
---

http://servidor_address/messages.json?last_message_timestamp=XXXX&contact_number=XXXX
