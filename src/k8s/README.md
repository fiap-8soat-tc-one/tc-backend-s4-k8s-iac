# O que é o K3d ?

O k3d é uma ferramenta leve que serve como um facilitador para executar o k3s, uma distribuição mínima do Kubernetes desenvolvida pelo Rancher Labs. Ele permite que desenvolvedores criem e gerenciem clusters k3s de forma rápida e fácil diretamente no Docker.

Atualmente o k3s é um projeto que é mantido pela comunidade open-source, apesar de ser um produto desenvildo pela Racher Labs ele não é comercializado pela (SUSE), seu desenvolvimento foi pensando no dia a dia, para facilitar a vida dos desenvolvedores e administradores de infraestrutura no deployment de aplicações, através da sua simplicidade e otimização de recursos de hardware como memória e CPU do clusters/nodes.

# Como instalar um cluster local utilizando k3d ?

Para instalar e utilizar um cluster K3d em seu ambiente local é necessário os seguintes softwares instalado:

✅ Docker v20.10, para utilizar o cluster atualizado na vesão 5.x.x.

✅ Utilitário Kubectl para interagir através de comandos com o k8s.

Abaixo deixo os links para download do kubectl de acordo com seu OS:

👉 https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/   

👉 https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/

👉https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/

Nota: Caso queira entender um pouco mais como funciona o comando kubectl, segue abaixo o link da documentação:

👉 https://kubernetes.io/docs/reference/kubectl/generated/kubectl/

Obs: Estou exemplificando a instalacão do K3d em um ambiente Linux. Caso esteja utilizando outro sistema operacional basta seguir o tutorial dos links abaixo:

👉 https://community.chocolatey.org/packages/k3d/

👉 https://formulae.brew.sh/formula/k3d

### Execute o comando abaixo para instalar o k3d no Linux

Abra o terminal do linux e execute o seguinte comando para baixar os pacotes e instalar:


#️⃣ wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

![Image](/assets/image.png)


Com sucesso na instalação execute o comando abaixo para validar os comandos e começar a sua jornada na criação do seu cluster. 🚀

#️⃣ k3d  —help

![Image1](/assets/image%201.png)

Agora execute o seguinte comando para criar seu cluster:

#️⃣ sudo k3d cluster create APP-FIAP

![alt text](/assets/image%202.png)

Em seguida execute o comando abaixo para visualização do cluster criado:


#️⃣ sudo k3d cluster list

![alt text](/assets/image%203.png)


Agora que o cluster já está instalado, vamos criar nossa primeira “namespace” ou melhor dizendo nossa area reservada para o APP. Para isso execute o seguinte comando:


#️⃣ sudo kubectl create namespace fiap

![alt text](/assets/image%204.png)

Você pode listar todas as namespaces criadas com o seguinte comando:

#️⃣ sudo kubectl get namespaces

![alt text](/assets/image%205.png)


Em nosso ambiente estamos utilizando HPA ( Horizontal Pod Autoscaler ), para permitir que nossa aplicação seja altamente resiliente e escalavél suportando a carga de acordo com a demanda.

Para isso é necessário instalar um componente conhecido como Metrics Server, pois ele é um Pod que fica configurado no seu cluster para analisar o comportamento em nivel de carga e processamento de CPU e Memória de suas aplicações.

Nota: Para instalar o Metrics-Server é necessário, ter o Helm instalado. No ambiente linux executamos os seguintes comandos:

```bash
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```

Com o gerenciador de pacote Helm instalado, execute os comandos abaixo para instalar o componente do metrics-server:


```bash
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm repo update
helm upgrade --install --set args={--kubelet-insecure-tls} metrics-server metrics-server/metrics-server --namespace kube-system
```

Agora que temos o metrics-server instalado em nosso cluster basta executar o seguinte comando abaixo, para validar sua criação:


#️⃣ sudo kubectl get pods -n kube-system

![alt text](/assets/image%206.png)


Com o ambiente devidamente prepardo, vá até a pasta “kubernetes” aonde contém os arquivos de manifestos da aplicação e execute em seu terminal os seguintes comandos:


```bash
kubectl apply -f 1-namespace.yaml
kubectl apply -f 2-secrets.yaml
kubectl apply -f 3-deployment.yaml
kubectl apply -f 4-hpa.yaml
kubectl apply -f 5-services.yaml
```


Os comandos acima criarão o secrets e o deployment necessários para rodar sua aplicação. 

Basicamente o “secrets” é o arquivo que contêm as credencias de acesso ao banco de forma segura utilizando hash base64. 

Já o arquivo de “deployment” possui todas configuração do ambiente, desde a camada de conexão em nível de rede até as especifições mais detalhadas dos containers.

Execute o seguinte comando para validar se sua aplicação está rodando corretamente no K8s:


#️⃣ kubectl get pods —namespace fiap

![alt text](/assets/image%207.png)


Parabéns, sua aplicação está rodando. 👏 🚀