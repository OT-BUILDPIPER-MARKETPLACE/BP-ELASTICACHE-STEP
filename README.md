# BP-ELASTICACHE-STEP
I'll steup ELASTICACHE using opstree tf module

## Setup
* Clone the code available at [BP-ELASTICACHE-STEP](https://github.com/OT-BUILDPIPER-MARKETPLACE/BP-ELASTICACHE-STEP)
* Build the docker image

```
git submodule init
git submodule update
docker build -t ot/tf-elasticache-step:0.1 .
```

* Do local testing via image only

```
# terraform with default(apply)
docker run -it --rm -v $PWD:/src -e WORKSPACE=/src -e CODEBASE_DIR=/ ot/tf-elasticache-step:0.1

# terraform with plan
docker run -it --rm -v $PWD:/src -e WORKSPACE=/ -e CODEBASE_DIR=/src -e TF_CODE_LOCATION=<?> -e AWS_ACCESS_KEY_ID=<?> -e AWS_SECRET_ACCESS_KEY=<?> -e INSTRUCTION=plan ot/tf-elasticache-step:0.1

```