# MLOps tutorial

https://mlops-for-mle.github.io/tutorial/

에서 진행하는 튜토리얼 학습 레포 입니다.

### Environment

- Mac OS
- Poetry
- Docker
- PostgreSQL
- scikit learn
- MLflow
- MinIO

### Day 01

- 도커 설치 및 PostgreSQL DB 서버 생성
- DB의 role name과 attribute 확인
- 생성된 DB에 query를 작성하여 테이블 생성

### Day 02

- 생성한 테이블에 iris 데이터 삽입
- 자동으로 삽입해주는 스크립트 작성

### Day 03

- 앞의 코드를 도커에서 활용하기 위해 Dockerfile 작성
- Docker 컨테이너 간의 네트워크를 연결하여 DB에 데이터 삽입
- DB 컨테이너와 데이터 생성 컨테이너를 묶는 Docker Compose 파일 작성

### Day 04

- 기본적인 모델 학습 및 저장
- 모델 파이프라인 작성

### Day 05

- DB 에서 데이터를 가져오는 파이프라인 작성
- 이를 활용한 모델 스크립트 작성

### Day 06

- Docker Compose를 이용하여 MLflow 서버를 구축 및 띄움
- 모델을 학습하고 MLflow 서버에 저장
  - MLflow Database에 iris 데이터를 저장하는 코드가 없음
  - 이전에서 이용했던 data_generator.py를 활용하여 도커를 띄우고 데이터를 넣은 후 학습 진행
  - 추후에 Docker Compose 파일을 수정하여 data_generator 서버도 띄울 예정
  - Docker Compose 당시 platform이 맞지않는 부분 수정 완료
    > mlflow-server The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
    >

### Day 07

- MLflow에 저장된 모델을 불러오는 스크립트 작성
- 불러온 모델을 통하여 추론 및 결과 비교

### Day 08

- FastAPI document를 참고하여 간단한 API 제작
- Path/Query Parameter를 이용하여 API 제작
- FastAPI를 이용하여 CRUD를 수행하는 API 제작
- Pydantic을 이용하여 Create부분을 수정
- Docker에서 FastAPI 실행

### Day 09

- MLflow 서버를 통해 model의 정보를 다운받고 FastAPI를 통해 예측값을 반환하는 API 제작
- 이를 Dockerfile과 Docker Compose 파일로 만들어 API 실행

### Day 10

- Kafka의 전체 아키텍처에 대해 학습
- Zookeeper & Broker 학습 및 Docker Compose를 통해 생성
- Docker Compose를 이용하여 Zookeeper, Broker, Schema Registry, Connect 생성
- Connect에 Source Connector 생성
- Docker Compose를 이용하여 데이터를 전달받을 Target DB 서버와 Connect에 Sink Connector 생성

### Day 11

- Stream Serving을 위한 Data Subscriber 코드 작성
- Docker Compose를 이용하여 Data Subscriber를 생성

### Day 12

- Grafana 대시보드를 통해 실시간으로 데이터를 모니터일하는 대시보드 작성
- Grafana에 원본 데이터와 예측값을 시각화