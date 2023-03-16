# Create VPC
resource "aws_vpc" "my-test-vpc" {
    cidr_block            = var.vpc_cidr
    instance_tenancy      = "default"
    enable_dns_hostnames  = true 

    tags     = {
        Name = "${var.project_name}-${var.environment}-vpc"
    }
}

#Create internet gateway and attach it to vpc
resource "aws_internet_gateway" "my-test-igw" {
    vpc_id = aws_vpc.my-test-vpc.id

    tags     = {
        Name = "${var.project_name}-${var.environment}-igw"
    }
}

# Use data source to get all avaialbility zones in region 
data "aws_availability_zones" "availability_zones" {}

# Create public subnet AZ1
resource"aws_subnet" "my-test-public-subnet-az-1" {
    vpc_id            = aws_vpc.my-test-vpc.id
    cidr_block        = var.my-test-public-subnet-az-1_cidr
    availability_zone = data.aws_availability_zones.availability_zones.names[0]
    map_public_ip_on_launch = true

    tags     = {
        Name = "${var.project_name}-${var.environment}-public-az1"
    }
}

# Create Route Table and add public route
resource"aws_route_table" "my_public_route_table" {
    vpc_id  = aws_vpc.my-test-vpc.id

    route{
        cidr_block = "0.0.0.0/16"
        gateway_id = aws_internet_gateway.my-test-igw.id
    }

    tags     = {
        Name = "${var.project_name}-${var.environment}-public-rt"
    }
}

# Associate public subnet az1 to "pulic route table"
resource"aws_route_table_association" "public_subnet_az1_rt_association" {
    subnet_id      = aws_subnet.my-test-public-subnet-az-1.id
    route_table_id = aws_route_table.my_public_route_table.id
}
# Create private app subnet az1
resource"aws_subnet" "my-test-private-app-subnet-az1" {
    vpc_id            = aws_vpc.my-test-vpc.id
    cidr_block        = var.my-test-private-subnet-az1_cidr
    availability_zone = data.aws_availability_zones.availability_zones.names[0]
    map_public_ip_on_launch = false

    tags     = {
        Name = "${var.project_name}-${var.environment}-private-app-az1"
    }
}
# Create private app subnet az2
resource"aws_subnet" "my-test-private-app-subnet-az2" {
    vpc_id            = aws_vpc.my-test-vpc.id
    cidr_block        = var.my-test-private-subnet-az2_cidr
    availability_zone = data.aws_availability_zones.availability_zones.names[1]
    map_public_ip_on_launch = false

    tags     = {
        Name = "${var.project_name}-${var.environment}-private-app-az2"

    }
}
       
#Create private app subnet az3
resource"aws_subnet" "my-test-private-app-subnet-az-3" {
    vpc_id            = aws_vpc.my-test-vpc.id
    cidr_block        = var.my-test-private-subnet-az3_cidr
    availability_zone = data.aws_availability_zones.availability_zones.names[2]
    map_public_ip_on_launch = false

    tags     = {
        Name = "${var.project_name}-${var.environment}-private-app-az-3"

    }
}


