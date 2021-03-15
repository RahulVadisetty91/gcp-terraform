# Google provider
provider "google" {
  credentials = "${file("groovy-works.json")}"
  project = "groovy-works-307303"
}