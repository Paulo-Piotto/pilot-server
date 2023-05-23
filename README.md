# pilot-server

## Como rodar:

Você vai precisar ter postgres e Node instalados na sua máquina e seguir esses passos: 
 
 BACK-END 
 - `git clone https://github.com/Paulo-Piotto/pilot-server.git`
 - conectar no psql e rodar o comando: `CREATE DATABASE nome_que_preferir;`
 - dentro da pasta do projeto rodar `npm i`
 - preencher o `.env`:
 ```
	DATABASE_URL="postgres://postgres:suasenha@localhost:5432/nome_do_banco"
	PORT=5000 - ou outra que preferir
	SERVER_SECRET='segredoxablau' - uma string qualquer, mas precisa ser o mesmo secret no back e no front end
	BCRYPT_SALT=10
 ```
 - na pasta do projeto rodar:
  `npx prisma migrate dev`
  `npm run seed`
  `npm run dev`
  
  E depois seguir os passos para rodar o front que pode ser encontrado em: https://github.com/Paulo-Piotto/pilot-app
