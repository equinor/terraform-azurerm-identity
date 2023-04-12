package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestGithubActionsOidcExample(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/github-actions-oidc",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}
