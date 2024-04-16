# Lambda Layer for python NLTK package

Credit to https://github.com/customink/lambda-python-nltk-layer 

Lambda layer to enable using famous NLTK python package with lambda.

Work with Lambda functions packaged as both docker images and Zip packages.

### Lambda functions packaged as Docker Images or OCI Images

To use Lambda NLTK with docker images, package your web app (http api) in a Dockerfile, and add one line to copy NLTK data files to /opt/nltk_data inside your container:

Pre-compiled Lambda NLTK data are provided in ECR public repo: public.ecr.aws/m5s2b0d4/nltk_lambda_layer. 

```dockerfile
COPY --from=public.ecr.aws/m5s2b0d4/nltk_lambda_layer:latest /nltk_data /opt/nltk_data
```

Then add one line to config env variable `NLTK_DATA` 

```dockerfile
ENV NLTK_DATA=/opt/nltk_data
``


Below is a Dockerfile for [an example nodejs application](examples/Dockerfile).
