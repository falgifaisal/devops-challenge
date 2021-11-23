date +%Y-%m-%d-%H-%M-%S > new-build.txt

sudo docker build --no-cache -t devops-challenge-$(cat new-build.txt) .

sudo docker tag devops-challenge-$(cat new-build.txt) localhost:32000/devops-challenge-$(cat new-build.txt)

sudo docker push localhost:32000/devops-challenge-$(cat new-build.txt)

pod=$(sudo microk8s.kubectl describe deployment | grep devops-challenge-2021 | cut -d ":" -f 1)

echo "$pod" > pod.txt

old=$(cat pod.txt  | cut -d " " -f 4)

echo "$old"

sudo microk8s.kubectl set image deployment/devops-challenge "$old"=localhost:32000/devops-challenge-$(cat new-build.txt)
