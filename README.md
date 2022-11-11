# BP-ELASTICACHE-STEP
I'll setup Elasticache Redis


## Setup
* Clone the code available at [BP-TF-STEP](https://github.com/OT-BUILDPIPER-MARKETPLACE/BP-ELASTICACHE-STEP)
* Build the docker image

```
git submodule init
git submodule update
docker build -t ot/tf-elasticache-step:0.0.1 .
```

* Do local testing via image only

```
# terraform with default(apply)
docker run -it --rm -v $PWD:/src -e WORKSPACE=/src -e CODEBASE_DIR=/ ot/tf-elasticache-step:0.0.1

# terraform with plan
docker run -it --rm -v $PWD:/src  -e INSTRUCTION=plan -e WORKSPACE=/src -e CODEBASE_DIR=/ ot/tf-elasticache-step:0.0.1

```
## NOTE: Check [variable.tf](https://github.com/OT-BUILDPIPER-MARKETPLACE/BP-ELASTICACHE-STEP/blob/elasticache-step/variable.tf) and pass required values in terraform.tfvars if required. For more information [click here](https://registry.terraform.io/modules/OT-CLOUD-KIT/elasticache/aws/latest?tab=inputs)