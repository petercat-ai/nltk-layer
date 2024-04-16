FROM public.ecr.aws/docker/library/python:3.12.0-slim-bullseye

COPY --from=public.ecr.aws/m5s2b0d4/nltk_lambda_layer:preview /nltk_data /opt/nltk_data

# Copy function code
COPY . ${LAMBDA_TASK_ROOT}
# from your project folder.
COPY requirements.txt .
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}" -U --no-cache-dir

ENV NLTK_DATA=/opt/nltk_data
CMD ["python", "main.py"]