resource "aws_eip" "eip" {
  vpc      = true
  instance = element(aws_instance.instance-az2.*.id, count.index)
  count    = var.elastic_ip ? 1 : 0
}
