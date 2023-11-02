### model development tutorial
# FROM amd64/python:3.9-slim

# RUN apt-get update && apt-get install -y \
#     postgresql-client \
#     && rm -rf /var/lib/apt/lists/*

# WORKDIR /usr/app

# RUN pip install -U pip &&\
#     pip install scikit-learn pandas psycopg2-binary

# COPY data_generator.py data_generator.py

# ENTRYPOINT ["python", "data_generator.py", "--db-host"]
# # Change CMD to solve host finding error
# CMD ["localhost"]

### mlflow tutorial
# FROM amd64/python:3.9-slim

# RUN apt-get update && apt-get install -y \
#     git \
#     wget \
#     && rm -rf /var/lib/apt/lists/*

# RUN pip install -U pip &&\
#     pip install boto3==1.26.8 mlflow==1.30.0 psycopg2-binary

# RUN cd /tmp && \
#     wget https://dl.min.io/client/mc/release/linux-amd64/mc && \
#     chmod +x mc && \
#     mv mc /usr/bin/mc

### FastAPI on Docker
# FROM amd64/python:3.9-slim

# WORKDIR /usr/app

# RUN pip install -U pip \
#     && pip install "fastapi[all]"

# COPY crud_pydantic.py crud_pydantic.py

# CMD ["uvicorn", "crud_pydantic:app", "--host", "0.0.0.0", "--reload"]

### API Serving
FROM amd64/python:3.9-slim

WORKDIR /usr/app

RUN pip install -U pip &&\
    pip install mlflow==1.30.0 pandas scikit-learn "fastapi[all]"

COPY schemas.py schemas.py
COPY app.py app.py
COPY sk_model/ sk_model/

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--reload"]