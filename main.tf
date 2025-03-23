provider "aws" {  
region = "us-east-1"      
}


resource "aws_vpc" "main" {                            
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true   

  tags = {
    Name = "MainVPC"
  }
}

resource "aws_subnet" "public_subnet_1" {   
  vpc_id                  = aws_vpc.main.id      
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"  

  tags = {
    Name = "PublicSubnet1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "PublicSubnet2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "MainIGW"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "subnet_1_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "subnet_2_assoc" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "efs-sg" {
  name        = "efs"
  description = "Allow inbound and outbound traffic"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "efs_sg"
  }
 

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress-rules
    content {
         description      = "Inbound Rules"
         from_port        = port.value
         to_port          = port.value
         protocol         = "TCP"
         cidr_blocks      = ["0.0.0.0/0"] 
    }
  }

 dynamic "egress" {
    iterator = port
    for_each = var.egress-rules
    content {
         description      = "outbound Rules"
         from_port        = port.value
         to_port          = port.value
         protocol         = "TCP"
         cidr_blocks      = ["0.0.0.0/0"] 
    }
  }
}	

variable "server_configs" {        
  description = "A map of server configurations"                                                 
  type = map(object({
    name          = string
    ami           = string
    keyname       = string
    ami           = sting
    instance_type = string
    availability_zone = string 
  
  }))
  default = {
    "web_server" = {
      name          = "instance-1"
      ami           = "ami-12345678"       
      instance_type = "t2.micro"
      key_name       = "splunk" 
      availability_zone = "ap-south-1a"   
    }
 
   "web_server" = {
      name          = "instance-2" 
      ami           = "ami-12345678"       
      instance_type = "t2.micro"
      key_name       = "splunk" 
      availability_zone = "ap-south-1b"
    }
 }
}

resource "aws_instance" "server" {  
  for_each = var.server_configs

  ami           = each.value.ami
  key_name      = each.value.key_name
  instance_type = each.value.instance_type  
  subnet_id     = [aws_subnet.public_subnet_1.id, aws_subnet_2.public_subnet_2.id]
  availability_zone = each.value.availabilityzone
  vps_security_group_ids = [aws_security_group.efs-sg.id]    
  tags = {
    Name = each.value.name
  }
}



resource "aws_efs_file_system" "example" {
  creation_token = "example-token"  
  performance_mode = "generalPurpose"  
}

resource "aws_efs_mount_target" "mt1" {
  file_system_id = aws_efs_file_system.example.id
  subnet_id      = aws_subnet.public_subnet_1.id 
  security_groups = [aws_security_group.efs-sg.id] 
}

resource "aws_efs_mount_target" "mt2" {
  file_system_id = aws_efs_file_system.example.id
  subnet_id      = aws_subnet.public_subnet_2.id
  security_groups = [aws_security_group.efs-sg.id]  
} 
