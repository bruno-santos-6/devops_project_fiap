from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import timedelta
from google.cloud import storage
import os
import kagglehub
import pendulum

GCS_BUCKET = "c4br-data_appl_monetizacao_ddc_datasharing-dev"
GCS_BLOB_NAME = "sales_data/sales_dataset.csv"

# Eu defini as variáveis de ambiente KAGGLE_USERNAME e KAGGLE_KEY porque a biblioteca
# kagglehub já lê essas credenciais diretamente das variáveis de ambiente configuradas no Cloud Composer


def download_and_upload_to_gcs():
    dataset_path = kagglehub.dataset_download("kyanyoga/sample-sales-data")
    local_file = os.path.join(dataset_path, "Sample-Sales-Data.csv")

    client = storage.Client()
    bucket = client.bucket(GCS_BUCKET)
    blob = bucket.blob(GCS_BLOB_NAME)
    blob.upload_from_filename(local_file)
    print(f"Arquivo {local_file} carregado em gs://{GCS_BUCKET}/{GCS_BLOB_NAME}")


local_tz = pendulum.timezone("America/Sao_Paulo")

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'retries': 2,
    'retry_delay': timedelta(minutes=5)
}

dag = DAG(
    'kaggle_daily_download',
    default_args=default_args,
    start_date=pendulum.datetime(2025, 2, 26, tz=local_tz),
    description='Download diário do dataset do Kaggle para o GCS',
    schedule_interval='0 9 * * *',
    catchup=False
)

run_etl = PythonOperator(
    task_id='download_and_upload_task',
    python_callable=download_and_upload_to_gcs,
    dag=dag
)

run_etl