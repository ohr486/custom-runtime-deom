# custom runtime demo

## bash demo

## elixir demo

### 1. build docker image

```
$ git clone https://github.com/alertlogic/erllambda_docker.git
$ docker build -t erllambda:21 erllambda_docker/21
$ docker build -t erllambda:21-elixir erllambda_docker/elixir
```

### 2. build elixir app

```
$ mix deps.get
$ docker run -it --rm -v `pwd`:/buildroot -w /buildroot -e MIX_ENV=prod erllambda:21-elixir mix erllambda.release
```

### 3. create s3 bucket

### 4. packaging

```
$ aws cloudformation package --template-file etc/template.yaml --output-template-file packaged.yaml --s3-bucket <YOUR-BUCKET>
```

### 5. deploy

```
$ aws cloudformation deploy --capabilities CAPABILITY_IAM --template-file packaged.yaml --stack-name <YOUR-STACK>
```

### 6. describe stack

```
$ aws cloudformation describe-stacks --stack-name <YOUR-STACK> --query 'Stacks[].Outputs'
$ export APIENDP=<SET-YOUR-ENDPOINT>
```

### 7. create item

```
$ curl -X POST "$APIENDP?id=foo&bar=quz"
```

### 8. get item

```
$ curl $APIENDP
```

### 9. delete item

```
$ curl -X DELETE "$APIENDP?id=foo"
```

### 10. delete stack

```
$ aws cloudformation delete-stack --stack-name <YOUR-STACK>
```
