#/bin/bash
NS=default

NAME=$(kubectl get pod -n $NS | grep -E 'csd-metric-interface' | awk '{print $1}')

#echo "Exec Into '"$NAME"'"

#kubectl exec -it $NAME -n $NS /bin/sh

# 원격 서버의 정보
remote_user="root"
remote_server="10.1.2.2"
remote_command="docker ps -a | grep csd-metric-collector"  # 실행하고 싶은 명령어

# SSH로 원격 서버에 접속하고 명령어 실행
ssh $remote_user@$remote_server "$remote_command"

for ((;;))
do
kubectl logs -f -n $NS $NAME --tail 10
done
