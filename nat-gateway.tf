# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az1 
resource "aws_eip" "eip1" {
  vpc    = true

  tags   = {
    Name = "${var.project_name}-${var.environment}-eip1"
  }
}

# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az2
resource "aws_eip" "eip2" {
  vpc    = true

  tags   = {
    Name = "${var.project_name}-${var.environment}-eip2"
  }
}

# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az3
resource "aws_eip" "eip3" {
  vpc    = true

  tags   = {
    Name = "${var.project_name}-${var.environment}-eip3"
  }
}

# create nat gateway in public subnet az1
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.my-test-public-subnet-az-1.id 

  tags   = {
    Name = "${var.project_name}-${var.environment}-ng-az1"
  }

  # to ensure proper ordering, it is recommended to add an explicit dependency
  # on the internet gateway for the vpc
  depends_on = [aws_internet_gateway.my-test-igw]
}

# create nat gateway in public subnet az2
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.my-test-public-subnet-az-2.id

  tags   = {
    Name = "${var.project_name}-${var.environment}-ng-az2"
  }

  # to ensure proper ordering, it is recommended to add an explicit dependency
  # on the internet gateway for the vpc
  depends_on = [aws_internet_gateway.my-test-igw]
}

# create nat gateway in public subnet az3
resource "aws_nat_gateway" "nat_gateway_az3" {
  allocation_id = aws_eip.eip3.id
  subnet_id     = aws_subnet.my-test-public-subnet-az-3.id

  tags   = {
    Name = "${var.project_name}-${var.environment}-ng-az3"
  }

  # to ensure proper ordering, it is recommended to add an explicit dependency
  # on the internet gateway for the vpc
  depends_on = [aws_internet_gateway.my-test-igw]
}

# create private route table az1 and add route through nat gateway az1
resource "aws_route_table" "private_route_table_az1" {
  vpc_id            = aws_vpc.my-test-vpc.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat_gateway_az1.id
  }

  tags   = {
    Name = "${var.project_name}-${var.environment}-private-rt-az1"
  }
}

# associate private app subnet az1 with private route table az1
resource "aws_route_table_association" "private_app_subnet_az1_rt_az1_association" {
  subnet_id         = aws_subnet.my-test-private-app-subnet-az1.id
  route_table_id    = aws_route_table.private_route_table_az1.id
}

# create private route table az2 and add route through nat gateway az2
resource "aws_route_table" "private_route_table_az2" {
  vpc_id            = aws_vpc.my-test-vpc.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat_gateway_az2.id
  }

  tags   = {
    Name = "${var.project_name}-${var.environment}-private-rt-az2"
  }
}

# associate private app subnet az2 with private route table az2
resource "aws_route_table_association" "private_app_subnet_az2_rt_az2_association" {
  subnet_id         = aws_subnet.my-test-private-app-subnet-az2.id
  route_table_id    = aws_route_table.private_route_table_az2.id
}

# create private route table az3 and add route through nat gateway az3
resource "aws_route_table" "private_route_table_az3" {
  vpc_id            = aws_vpc.my-test-vpc.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat_gateway_az3.id
  }

  tags   = {
    Name = "${var.project_name}-${var.environment}-private-rt-az3"
  }
}
# associate private app subnet az3 with private route table az3
resource "aws_route_table_association" "private_app_subnet_az3_rt_az3_association" {
  subnet_id         = aws_subnet.my-test-private-app-subnet-az-3.id
  route_table_id    = aws_route_table.private_route_table_az3.id
}

