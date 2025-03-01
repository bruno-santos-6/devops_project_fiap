import apache_beam as beam
import logging
from datetime import datetime

# ---------------------------
# Configurações e Definições
# ---------------------------

HEADERS = [
    'ORDERNUMBER', 'QUANTITYORDERED', 'PRICEEACH', 'ORDERLINENUMBER', 'SALES',
    'ORDERDATE', 'STATUS', 'QTR_ID', 'MONTH_ID', 'YEAR_ID', 'PRODUCTLINE',  # CORRIGIDO
    'MSRP', 'PRODUCTCODE', 'CUSTOMERNAME', 'PHONE', 'ADDRESSLINE1',
    'ADDRESSLINE2', 'CITY', 'STATE', 'POSTALCODE', 'COUNTRY', 'TERRITORY',
    'CONTACTLASTNAME', 'CONTACTFIRSTNAME', 'DEALSIZE'
]

BQ_SCHEMA = {
    "fields": [
        {"name": "ORDERNUMBER", "type": "INTEGER"},
        {"name": "QUANTITYORDERED", "type": "INTEGER"},
        {"name": "PRICEEACH", "type": "FLOAT"},
        {"name": "ORDERLINENUMBER", "type": "INTEGER"},
        {"name": "SALES", "type": "FLOAT"},
        {"name": "ORDERDATE", "type": "TIMESTAMP"},
        {"name": "STATUS", "type": "STRING"},
        {"name": "QTR_ID", "type": "INTEGER"},
        {"name": "MONTH_ID", "type": "INTEGER"},
        {"name": "YEAR_ID", "type": "INTEGER"},
        {"name": "PRODUCTLINE", "type": "STRING"},
        {"name": "MSRP", "type": "INTEGER"},
        {"name": "PRODUCTCODE", "type": "STRING"},
        {"name": "CUSTOMERNAME", "type": "STRING"},
        {"name": "PHONE", "type": "STRING"},
        {"name": "ADDRESSLINE1", "type": "STRING"},
        {"name": "ADDRESSLINE2", "type": "STRING"},
        {"name": "CITY", "type": "STRING"},
        {"name": "STATE", "type": "STRING"},
        {"name": "POSTALCODE", "type": "STRING"},
        {"name": "COUNTRY", "type": "STRING"},
        {"name": "TERRITORY", "type": "STRING"},
        {"name": "CONTACTLASTNAME", "type": "STRING"},
        {"name": "CONTACTFIRSTNAME", "type": "STRING"},
        {"name": "DEALSIZE", "type": "STRING"}
    ]
}

# ---------------------------
# Funções de Processamento
# ---------------------------

def parse_csv(line):
    try:
        valores = line.split(',')
        if len(valores) != len(HEADERS):
            logging.error(f"Linha inválida (colunas incorretas): {line}")
            return None

        elemento = dict(zip(HEADERS, valores))

        # Conversões com tratamento individual de erros
        try:
            elemento['QUANTITYORDERED'] = int(elemento['QUANTITYORDERED'])
        except ValueError as e:
            logging.error(f"Erro em QUANTITYORDERED: {line} | Erro: {e}")
            return None

        try:
            elemento['PRICEEACH'] = float(elemento['PRICEEACH'])
        except ValueError as e:
            logging.error(f"Erro em PRICEEACH: {line} | Erro: {e}")
            return None

        try:
            elemento['ORDERDATE'] = datetime.strptime(
                elemento['ORDERDATE'].strip(), "%Y-%m-%d %H:%M:%S"
            ).isoformat()
        except ValueError as e:
            logging.error(f"Erro em ORDERDATE: {line} | Erro: {e}")
            return None

        return elemento

    except Exception as e:
        logging.error(f"Erro crítico na linha: {line} | Erro: {str(e)}")
        return None

class TransformarDados(beam.DoFn):
    """Realiza transformações e validações adicionais."""
    def process(self, elemento):
        try:

            # Padronização de país
            elemento['COUNTRY'] = elemento['COUNTRY'].upper().strip()

            yield elemento

        except Exception as e:
            logging.error(f"Erro na transformação: {elemento} | Erro: {str(e)}")
            raise

# ---------------------------
# Pipeline Principal
# ---------------------------

with beam.Pipeline() as p:
    (p
     | 'Ler CSV' >> beam.io.ReadFromText(
         'gs://c4br-data_appl_monetizacao_ddc_datasharing-dev/sales_data/sales_dataset.csv',
         skip_header_lines=1
     )

     | 'Validar Estrutura' >> beam.Filter(
         lambda line: len(line.split(',')) == len(HEADERS)
     )

     | 'Parsear CSV' >> beam.Map(parse_csv)

     | 'Transformar Dados' >> beam.ParDo(TransformarDados())

     | 'Filtrar Dados Inválidos' >> beam.Filter(lambda x: x is not None)

     | 'Escrever no BigQuery' >> beam.io.WriteToBigQuery(
         table='br-apps-dolphin-ddp-dev:db_dolphin_stage.tbl_sales_orders',
         schema=BQ_SCHEMA,
         write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND,
         create_disposition=beam.io.BigQueryDisposition.CREATE_NEVER,
        custom_gcs_temp_location='gs://bucket_dataflow_teste/temp/',
         additional_bq_parameters={
             'timePartitioning': None,
             'clustering': None
         }
     )
    )