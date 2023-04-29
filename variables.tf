variable "inst_type" {
  type = string
  description = "Cal Desc: The size of the aws instance"
  default = "t2.micro"
  
 }

 variable "vpc_id" {
   type = string
   default = "vpc-8633c3ed"
   
 }

 variable "office_cidr_block" {
   type = string
   default = "172.59.190.238/32"

 }

 variable "home_cidr_block" {
   type = string
   default = "99.21.107.110/32"

 }
 variable "public_key" {
   type = string
   default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJi8B+QacHjp+Q3pp3nUoRuU/WEQ/JaQI4j1nf/Blt7wIPit/+ZY+DhTBMe2l0LiZRMvw5BfrMp0tgohzczN6aIZBh+nyIYnjbn7pIT3waTirX/bTanOLE9L+e6l58Z5O2tvhP88BHigmWGWyiB8iykFPRzHYrdiwz/du6c4cvS6MZ/KwIq5+lROSb8agENFSQXLCZ32OXlz5Lcc1n8Wf8KDsDYHGTqvZl+CkxaR9q+yahBxtQaJXiXYSoLiARjrE1QnEo1FrS1k5pI9931wvcefuSOuD1DsRhbew5SdiXkDrD0SaS0VAGPm/1LLdXqRxLh/yQlkXXv0XnCXTJ3YVAAOKQ8K1d0SKAf69zMLzwQRnAmAkDjoXhcrSbfA6Uih0LmoKsKjaR1Otbyqq4fUsMYCvCf3dmvIJJciR9wYabMgOY7yRfRf5SI/BACXI22cuk3lc0KGJDKIvCxVkklvPsiWaUQvmOkd00LT4jZ1ziXc1ILGa4AGgIBWI5OmP0Pr0= root@lap1"
 }

 variable "server_name" {
   type = string
   default = "Apache server"
 }

variable "ami" {
   type = string
   default = "ami-02f97949d306b597a"
 }