# instalar 
npm i -g serverless

# sls inicializar
sls

# sempre fazer deploy antes de tudo para verificar se está tudo ok
sls deploy

# invokar na AWS
sls invoke -f hello

# invokar local
sls invoke local -f hello --log

# configurar dashboard
sls 

# log 
sls logs -f hello --tail

# remover
sls remove