resource "aws_eip" "vpc_eip_1a" {
    domain = "vpc"  

    tags = {
        Name = format("%s-eip", var.project_name)
    }
}

resource "aws_nat_gateway" "nat_1a" {
  allocation_id = aws_eip.vpc_eip_1a.id
  subnet_id = aws_subnet.private_subnet_1a

  tags = {
        Name = format("%s-nat-la", var.project_name)
    }
}