workflow "Rebuild nextcloud-smb every other day" {
  on = "schedule(0 0 */2 * *)"
  resolves = ["Dockerhub build webhook"]
}

action "Dockerhub build webhook" {
  uses = "swinton/httpie.action@8ab0a0e926d091e0444fcacd5eb679d2e2d4ab3d"
  args = "["POST", $WEBHOOK]"
  secrets = ["WEBHOOK"]
}
