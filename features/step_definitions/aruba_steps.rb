Given("um arquivo chamado {string} contendo:") do |file_name, file_content|
  step %(a file named "#{file_name}" with:), file_content
end

When(/^eu executo `([^`]*)`$/) do |cmd|
  step %(I run `#{cmd}`)
end

Then("o arquivo {string} deve conter:") do |file_name, file_content|
  step %(the file named "#{file_name}" should contain:), file_content
end
