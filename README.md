# Projeto de Infraestrutura de Dados Automatizada em GCP  
**MBA em DataOps e DevOps**  

---

## 📌 Visão Geral  
Este projeto implementa um pipeline de dados automatizado para análise de vendas utilizando o dataset [Sample Sales Data](https://www.kaggle.com/datasets/kyanyoga/sample-sales-data). A infraestrutura foi construída na Google Cloud Platform (GCP) com foco em **DataOps, ETL, DevOps e Infraestrutura como Código (IAC)**, garantindo automação, escalabilidade e monitoramento contínuo.  

**Objetivos Principais:**  
- Automatizar a extração, transformação e carregamento (ETL) de dados.  
- Implementar CI/CD com Bitbucket, Cloud Build e Cloud Composer.  
- Criar dashboards interativos no Apache Superset para análise estratégica.  

---

## 🛠 Tecnologias Utilizadas  
| Categoria           | Ferramentas/Serviços                                                                 |  
|----------------------|-------------------------------------------------------------------------------------|  
| **Cloud**            | Google Cloud Platform (GCP)                                                         |  
| **Orquestração**     | Cloud Composer (Apache Airflow)                                                     |  
| **ETL**              | Apache Beam (Dataflow)                                                              |  
| **Armazenamento**    | Cloud Storage, BigQuery                                                             |  
| **DevOps**           | Bitbucket, Cloud Source Repositories, Cloud Build                                   |  
| **IAC**              | Terraform                                                                           |  
| **Visualização**     | Apache Superset (hospedado no GKE)                                                  |  
| **Monitoramento**    | Cloud Monitoring, Cloud Logging                                                     |  

---

## 🔍 Pré-requisitos  
Para reproduzir este projeto, são necessários:  
1. **Conta no GCP** com billing ativado.  
2. **Acesso à Kaggle API** para download do dataset ([instruções](https://www.kaggle.com/docs/api)).  
3. **Ferramentas Locais:**  
   - Terraform (`v1.5+`).  
   - Google Cloud SDK (`gcloud`).  
   - Python (`3.9+`) com bibliotecas: `apache-beam`, `google-cloud-storage`.  

---

## 🚀 Instalação e Configuração  

### 1. Configuração Inicial na GCP  
```bash  
# Autenticação no GCP  
gcloud auth login  
gcloud config set project br-apps-dolphin-ddp-dev

# Ativar APIs necessárias  
gcloud services enable composer.googleapis.com dataflow.googleapis.com  