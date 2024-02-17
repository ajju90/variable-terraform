## varibale type number ##

variable "groupByNumber" {
  type = number
}

resource "aws_iam_group" "name" {
  name = var.groupByNumber
}

#---------------------------------------------------------------#

## varibale type string ##

variable "groupBystring" {
  type = string
}

resource "aws_iam_group" "name2" {
  name = var.groupBystring
}

#---------------------------------------------------------------#

## LIST(string) ##

variable "userByList" {
  type = list(string)
  default = [ "umesh","bhau", "ajju","varun",]
}

resource "aws_iam_user" "userList" {
  name = var.userByList[2]
}

#---------------------------------------------------------------#

## LIST(number) ##

variable "groupByListAll" {
  type = list(string)
  default = ["group1","group2","group3","group4"]
}

resource "aws_iam_group" "groupList" {

  count = length(var.groupByListAll)
  name = var.groupByListAll[count.index]
}

#---------------------------------------------------------------#

## MAP(number) Signle ##

variable "userByMap" {
  type = map(number)
  default = {
    "a1" = 100
    "a2" = 200
    "a3" = 300
    "a4" = 400
  }
}
resource "aws_iam_user" "name" {
  name = var.userByMap.a3
}

#---------------------------------------------------------------#

## MAP(string) All Execute ##

variable "userByMapAll" {
  type = map(string)
  default = {
    "a1" = "varun"
    "a2" = "bhau"
    "a3" = "mau"
    "a4" = "pau"
  }
}

resource "aws_iam_user" "name" {
  for_each = var.userByMapAll
  name = each.value
}

#---------------------------------------------------------------#

## type = ANY ##
## Execute All ##

variable "userGroupByTypeANY" {
  type = any 
  default = {
    a1 = "umesh"
    a2 = 31012002
    a3 = ["mahesh","anil","damale"]
    a4 = {
        a4_1 = "dhondalgaon"
        a4_2 = "vaijapur"
        a4_3 = "chhatrapati sambhajinagar"
        a4_4 = "Maharashtra"
    }
  }
}

resource "aws_iam_group" "name" {
  for_each = var.userGroupByTypeANY
  name = each.value
}

