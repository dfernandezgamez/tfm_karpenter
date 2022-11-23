# tfm_karpenter
Proyecto con el código para desplegar EKS, Karpenter y la aplicación de pruebas


Para desplegar la infraestructura

terraform init
terraform plan
terraform appy

Antes de aplicar la siguiente configuracion se debe habilitar la compatibilidad con las instancias de tipo Spot si no se han utilizado instancias de tipo Spot anteriormente.

aws iam create-service-linked-role --aws-service-name spot.amazonaws.com

Si ya se habia aplicado, probablemente obtengamos el error:

An error occurred (InvalidInput) when calling the CreateServiceLinkedRole operation: 
Service role name AWSServiceRoleForEC2Spot has been taken in this account, 
please try a different suffix.

Para desplegar el provisioner de Karpenterejecutar:
kubectl apply -f ../kubernetes/karpenter.yaml    


Comandos útiles:

# To List Security Groups
aws ec2 describe-security-groups --query "SecurityGroups[? Tags[? (Key=='karpenter.sh/discovery') && (Value=='$CLUSTER_NAME')]].GroupId"

# To list Subnets
aws ec2 describe-subnets --query "Subnets[? Tags[? (Key=='karpenter.sh/discovery') && (Value=='$CLUSTER_NAME')]].SubnetId"

Desplegar un tomcat:

kubectl create deployment tomcatinfra --image=saravak/tomcat8