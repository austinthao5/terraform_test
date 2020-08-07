provider "artifactory" {
	url =  "https://armory.jfrog.io/artifactory/"	
	api_key = "AKCp5fTQwha8XMv8GXez8UgJoJQeMi4R9m4QTBxMKSJaevdGeUHYkWzv8e9zAM6kmWQm9H7Us"	
}	

resource "artifactory_user" "foobar" {	
	name  = "NAME_HERE_TEST"	
  	email = "EMAIL@EMAIL.COM"	
}
