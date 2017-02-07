@customers = Customer.create(
  [
    {
      email: "customer1@test.com",
      password: "password"
    },
    {
      email: "customer2@test.com",
      password: "password"
    },
    {
      email: "customer3@test.com",
      password: "password"
    }
  ]
).each(&:confirm)

@agents = Agent.create(
  [
    {
      email: "agent1@test.com",
      password: "password"
    },
    {
      email: "agent2@test.com",
      password: "password"
    }
  ]
).each(&:confirm)

@admin = Admin.create(
  [
    {
      email: "admin1@test.com",
      password: "password"
    },
    {
      email: "admin2@test.com",
      password: "password"
    }
  ]
).each(&:confirm)

@support_requests = SupportRequest.create(
  [
    {
      subject: "Installation Error",
      customer: Customer.first,
      agent: Agent.first,
      category: "installation_and_setup",
      description: "I am having trouble installing Skype. How do I do that?",
      status: "open"
    },
    {
      subject: "Unclear Voice",
      customer: Customer.first,
      agent: Agent.first,
      category: "voice_quality",
      description: "The voice quality is not very good. Any way to improve it?",
      status: "closed"
    },
    {
      subject: "Blurred Video",
      customer: Customer.all.sort[1],
      agent: Agent.all.sort[1],
      category: "video_quality",
      description: "The picture is blurred. Please help me out.",
      status: "open"
    }
  ]
)
