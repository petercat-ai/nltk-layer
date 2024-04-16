FROM public.ecr.aws/docker/library/python:3.12.0-slim-bullseye

COPY . ${LAMBDA_TASK_ROOT}
COPY requirements.txt .
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}" -U --no-cache-dir

# Setup NLTK again in system path to execute nltk.downloader
RUN pip install nltk
# Setup directory for NLTK_DATA
RUN mkdir -p ${LAMBDA_TASK_ROOT}/nltk_data

# Download NLTK_DATA to build directory
RUN python -W ignore -m nltk.downloader punkt -d ${LAMBDA_TASK_ROOT}/nltk_data
RUN python -W ignore -m nltk.downloader stopwords -d ${LAMBDA_TASK_ROOT}/nltk_data
RUN python -W ignore -m nltk.downloader averaged_perceptron_tagger -d ${LAMBDA_TASK_ROOT}/nltk_data

ENV NLTK_DATA=${LAMBDA_TASK_ROOT}/nltk_data
CMD ["python", "main.py"]