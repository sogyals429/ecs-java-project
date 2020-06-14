data "template_file" "assume_role"{
  template = file("tf_ecs/templates/ecs_svc_task_assume_role.json")
}

data "template_file" "assume_role_policy"{
  template = file("tf_ecs/templates/ecs_svc_task_assume_policy.json")
}

resource "aws_iam_role" "ecs_svc_container_assume" {
  name = "ecs_svc_container_assume"
  assume_role_policy = data.template_file.assume_role.rendered
}

resource "aws_iam_role_policy" "ecs_svc_container_assume" {
  name = "ecs_svc_container_assume"
  role = aws_iam_role.ecs_svc_container_assume.id
  policy      = data.template_file.assume_role_policy.rendered
}