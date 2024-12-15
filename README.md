# Kubernetes e Amazon Elastic Kubernetes Service (EKS)

## O que é Kubernetes?

Kubernetes (K8s) é uma plataforma de orquestração de contêineres open-source que automatiza a implantação, o dimensionamento e a gestão de aplicativos em contêiner. Ele foi originalmente desenvolvido pelo Google e atualmente é mantido pela Cloud Native Computing Foundation (CNCF).

Com o Kubernetes, é possível gerenciar clusters de máquinas virtuais ou físicas e distribuir aplicativos em contêineres por esses clusters, fornecendo alta disponibilidade, escalabilidade automática e automação de tarefas operacionais.

### Principais Componentes do Kubernetes

1. **Cluster**: Conjunto de nós gerenciados pelo Kubernetes.
   - **Master Node**: Responsável pelo controle e gerenciamento do cluster.
   - **Worker Nodes**: Executam os aplicativos contêinerizados.

2. **Pods**: A menor unidade do Kubernetes. Representa uma instância de um contêiner (ou grupo de contêineres) que compartilha a mesma rede e armazenamento.

3. **Deployment**: Gerencia a implantação e o ciclo de vida dos pods.

4. **Services**: Exposição de um grupo de pods para comunicação dentro e fora do cluster.

5. **Ingress**: Gerencia o tráfego externo para os serviços.

6. **ConfigMaps e Secrets**: Gerenciam configurações e informações sensíveis, como senhas.

## Vantagens do Kubernetes

1. **Portabilidade**:
   - Kubernetes é agnóstico de provedor de nuvem, permitindo rodar workloads em qualquer lugar (AWS, Google Cloud, Azure, ou on-premises).

2. **Escalabilidade Automática**:
   - Escala automaticamente as aplicações (Horizontal Pod Autoscaler) e os nós (Cluster Autoscaler) conforme a demanda.

3. **Resiliência e Recuperação Automática**:
   - Monitora continuamente os pods e reinicia automaticamente aqueles que falham.

4. **Ecossistema Extensível**:
   - Suporte a várias ferramentas e extensões, como Helm (gerenciamento de pacotes), Prometheus (monitoramento), e Istio (malha de serviço).

5. **Gestão Declarativa**:
   - A infraestrutura é gerenciada como código (IaC) usando arquivos YAML ou ferramentas como Terraform.

---

## Rodando na nuvem, O que é Amazon EKS?

O Amazon Elastic Kubernetes Service (EKS) é um serviço gerenciado pela AWS que facilita a execução de clusters Kubernetes na nuvem da AWS ou on-premises. Ele elimina a complexidade operacional de gerenciar o plano de controle (control plane) do Kubernetes, como atualizações, escalabilidade e alta disponibilidade.

O EKS permite que você aproveite o ecossistema Kubernetes nativo (como ferramentas, extensões e integrações), mas com a simplicidade e confiabilidade de um serviço gerenciado pela AWS.

## Por que usar Amazon EKS?

O Amazon EKS combina a robustez do Kubernetes com a simplicidade e a integração da AWS. Abaixo, listamos as principais razões para escolher o EKS:

### **Vantagens do EKS**

1. **Serviço Gerenciado**:
   - O EKS gerencia automaticamente o plano de controle (control plane) e os nós mestres. Isso inclui patches, atualizações e alta disponibilidade.

2. **Alta Disponibilidade**:
   - O plano de controle do EKS é replicado automaticamente em várias zonas de disponibilidade (AZs), garantindo tolerância a falhas.

3. **Integração com AWS**:
   - Suporte nativo para ferramentas AWS como CloudWatch (monitoramento), IAM (controle de acesso), VPC, ELB (balançador de carga), e Route 53.

4. **Segurança Avançada**:
   - Integração nativa com AWS IAM para autenticação e controle de acesso.
   - Suporte ao AWS PrivateLink para execução segura dentro de VPCs privadas.

5. **Escalabilidade Dinâmica**:
   - Suporte para escalar nós automaticamente com o Cluster Autoscaler ou o Karpenter.
   - Escalabilidade horizontal dos pods baseada na demanda.

6. **Flexibilidade de Execução**:
   - Suporte para instâncias EC2, Fargate (serverless) ou ambientes híbridos.

## Rodando locamente, O que é o K3d ?

O k3d é uma ferramenta leve que serve como um facilitador para executar o k3s, uma distribuição mínima do Kubernetes desenvolvida pelo Rancher Labs. Ele permite que desenvolvedores criem e gerenciem clusters k3s de forma rápida e fácil diretamente no Docker.

Atualmente o k3s é um projeto que é mantido pela comunidade open-source, apesar de ser um produto desenvildo pela Racher Labs ele não é comercializado pela (SUSE), seu desenvolvimento foi pensando no dia a dia, para facilitar a vida dos desenvolvedores e administradores de infraestrutura no deployment de aplicações, através da sua simplicidade e otimização de recursos de hardware como memória e CPU do clusters/nodes.

### Como instalar um cluster local utilizando k3d ?

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


Com o ambiente devidamente prepardo, navegue até o [repositório de iac](https://github.com/fiap-8soat-tc-one/tc-backend-s3-k8s-iac/tree/main/src/k8s)  aonde contém os arquivos de manifestos da aplicação e execute em seu terminal os seguintes comandos:


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
