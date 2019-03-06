docker build -t bbengfort/llama-web:latest -t bbengfort/llama-web:$SHA -f ./web/Dockerfile ./web
docker build -t bbengfort/llama-api:latest -t bbengfort/llama-api:$SHA -f ./api/Dockerfile ./api
docker build -t bbengfort/llama-worker:latest -t bbengfort/llama-worker:$SHA -f ./worker/Dockerfile ./worker

docker push bbengfort/llama-web:latest
docker push bbengfort/llama-api:latest
docker push bbengfort/llama-worker:latest
docker push bbengfort/llama-web:$SHA
docker push bbengfort/llama-api:$SHA
docker push bbengfort/llama-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/web-deployment web=bbengfort/llama-web:$SHA
kubectl set image deployments/api-deployment api=bbengfort/llama-api:$SHA
kubectl set image deployments/worker-deployment worker=bbengfort/llama-worker$SHA