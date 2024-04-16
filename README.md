# Lambda Layer for Python NLTK Package

Lambda layer to enable using the famous NLTK Python package with Lambda.

Credit to [customink/lambda-python-nltk-layer](https://github.com/customink/lambda-python-nltk-layer).

When using NLTK in AWS Lambda, you may encounter the following error due to NLTK needing to download [data files](https://www.nltk.org/data.html), but the file system in AWS Lambda is read-only:

```
[Errno 30] Read-only file system: '/home/sbx_user1051'
```

To resolve this issue, you can create a custom layer similar to [customink/lambda-python-nltk-layer](https://github.com/customink/lambda-python-nltk-layer).

However, if your Lambda function is packaged as a Docker image, you can resolve it as follows:


### Lambda Functions Packaged as Docker Images or OCI Images

To use Lambda NLTK with Docker images, package your web app (HTTP API) in a Dockerfile, and add one line to copy NLTK data files to `/opt/nltk_data` inside your container:

Pre-compiled Lambda NLTK data is provided in the ECR public repo: `public.ecr.aws/m5s2b0d4/nltk_lambda_layer`.

```dockerfile
COPY --from=public.ecr.aws/m5s2b0d4/nltk_lambda_layer:latest /nltk_data /opt/nltk_data
```

Then add one line to configure the environment variable `NLTK_DATA`:

```dockerfile
ENV NLTK_DATA=/opt/nltk_data
```

Below is a Dockerfile for [an example python application](examples/Dockerfile).
