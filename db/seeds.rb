@support_requests = SupportRequest.create(
  [
    {subject: "request 1"},
    {subject: "request 2"}
  ]
)

@users = User.create(
  [
    {
      email: "user1@test.com",
      password: "password"
    }
  ]
).each(&:confirm)
