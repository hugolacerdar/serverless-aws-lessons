# 1o passo - criar arquivo de políticas de segurança
# 2o passo - role de segurança na aws

aws iam create-role \
    --role-name lambda-ex \
    --assume-role-policy-document file://politicas.json \
    | tee logs/role.log

# 3o passo - criar arquivo com conteúdo e zipá-lo
zip function.zip index.js

aws lambda create-function \
    --function-name hello-w-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs14.x \
    --role arn:aws:iam::311766225036:role/lambda-ex \
    | tee logs/lambda-create.log

# 4o invoke lambda
aws lambda invoke \
    --function-name hello-w-cli \
    --log-type Tail \
    logs/lambda-exec.log

# -- atualizar, zipar
zip function.zip index.js

# atualizar lambda
aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-w-cli \
    --publish \
    | tee logs/lambda-update.log

# remover 
aws lambda delete-function \
    --function-name hello-w-cli 

aws iam delete-role \
    --role-name lambda-ex