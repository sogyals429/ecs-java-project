data "template_file" "assume_role"{
  template = file("templates/ecs_svc_task_assume_role.json")
}

data "template_file" "assume_role_policy"{
  template = file("templates/ecs_svc_task_assume_policy.json")
}

resource "aws_iam_role" "ecs_svc_container_assume" {
  name = "ecs_svc_container_assume"
  assume_role_policy = "${data.template_file.assume-role-policy.rendered}"
}