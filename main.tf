provider "artifactory" {
	username = "austin.thao@armory.io"
	password = "AKCp5fTQwha8XMv8GXez8UgJoJQeMi4R9m4QTBxMKSJaevdGeUHYkWzv8e9zAM6kmWQm9H7Us"
}

resource "artifactory_user" "foobar" {
	name  = "the.dude"
  	email = "the.dude@domain.com"
}
