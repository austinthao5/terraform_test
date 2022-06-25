terraform {
    required_providers {
        example = {
            version = "~> 1.0.0"
            source  = "linux_amd64/customtfprovider"
        }
    }
}
