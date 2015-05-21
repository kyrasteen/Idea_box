MagicLamp.register_fixture do
  @idea = Idea.new(title: "good idea", body: "grreat")
  render template: "homepage/index"
end
