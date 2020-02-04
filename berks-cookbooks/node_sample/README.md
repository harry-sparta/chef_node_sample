# node_sample

First cookbook.

Chef commands
- chef generate cookbook <name_cookbook>
- chef generate template <name_file.conf>

Kitchen commands


Topics covered:
- file and folder structure
- kitchen.yml
- spec folder -> default_spec.rb
- test folder -> default_test.rb
- recipe -> default.rb
- writing recipes and using resources
  - packages
  - service
  -include recipe
  - template
  - link
- Metadata file
- Using Supermarket


- Interpolation in ruby
  - ice cream cones <% %>
  - to print/generate output use ice cream cones with an = sign
    - <%= %>

  ## kitchen.yml
  This kitchen YAML file runs the sets the virtualisation in the localhost.

  ## kithcen_could.yml
  This kitchen YAML file (execute with KITCHEN_YML=kitchen_cloud.yml kitchen verify) connects to AWS and creates an EC2 instance to run test. Terminates the instance by running KITCHEN...=... kitchen destroy

  ## packer
  
