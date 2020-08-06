provider "artifactory" {
	url =  "https://armory.jfrog.io/artifactory/"
	api_key = "AKCp5fTQwha8XMv8GXez8UgJoJQeMi4R9m4QTBxMKSJaevdGeUHYkWzv8e9zAM6kmWQm9H7Us"
}

resource "artifactory_user" "foobar" {
	name  = "NAME_HERE_TEST"
  	email = "EMAIL@EMAIL.COM"
}


resource "artifactory_user" "foobar1" {
	name  = "NAME_HERE_TEST1"
  	email = "EMAIL1@EMAIL.COM"
}

resource "artifactory_user" "foobar2" {
	name  = "NAME_HERE_TEST2"
  	email = "EMAIL2@EMAIL.COM"
}

resource "artifactory_user" "foobar3" {
	name  = "NAME_HERE_TEST3"
  	email = "EMAIL3@EMAIL.COM"
}

resource "artifactory_user" "foobar4" {
	name  = "NAME_HERE_TEST4"
  	email = "EMAIL4@EMAIL.COM"
}

resource "artifactory_user" "foobar5" {
	name  = "NAME_HERE_TEST5"
  	email = "EMAIL5@EMAIL.COM"
}

resource "artifactory_user" "foobar7" {
	name  = "NAME_HERE_TEST7"
  	email = "EMAIL7@EMAIL.COM"
}
