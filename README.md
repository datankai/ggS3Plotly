# ggS3plotly

This package lets you to automatically upload plots generated with ggplot to s3, trough plotly.

To use the package, you will need an AWS account and to enter your credentials into R. Your keypair can be generated on the [IAM Management Console](https://aws.amazon.com/) under the heading *Access Keys*. Note that you only have access to your secret key once. After it is generated, you need to save it in a secure location. New keypairs can be generated at any time if yours has been lost, stolen, or forgotten. The [**aws.iam** package](https://github.com/cloudyr/aws.iam) profiles tools for working with IAM, including creating roles, users, groups, and credentials programmatically; it is not needed to *use* IAM credentials.

A detailed description of how credentials can be specified is provided at: https://github.com/cloudyr/aws.signature/. The easiest way is to simply set environment variables on the command line prior to starting R or via an `Renviron.site` or `.Renviron` file, which are used to set environment variables in R during startup (see `? Startup`). They can be also set within R:

```R
Sys.setenv("AWS_ACCESS_KEY_ID" = "mykey",
           "AWS_SECRET_ACCESS_KEY" = "mysecretkey",
           "AWS_DEFAULT_REGION" = "us-east-1",
           "AWS_SESSION_TOKEN" = "mytoken")
```

To use the package with S3-compatible storage provided by other cloud platforms, set the `AWS_S3_ENDPOINT` environment variable to the appropriate host name. By default, the package uses the AWS endpoint: `s3.amazonaws.com`

To use it you simple need to wrap a plot object on the exposed method ggS3plotly like so.

```R
ggS3plotly(ggplot(iris, aes(x = Sepal.Length, y = Petal.Width, color = Species)) + geom_point())
```