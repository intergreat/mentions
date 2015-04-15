  Feature: Base case


  @api @javascript
  Scenario: internal test 
  Given I am logged in as a user with the "administrator" role
  When I visit "admin/config/content/formats/manage/basic_html" 
  And I check "Mentions Filter"
  And I press the "Save configuration" button
  And I wait 5 seconds
  And I visit "admin/config/content/formats/manage/basic_html"
  Then the "Mentions Filter" checkbox should be checked

  @api @javascript
  Scenario: Add simple node with a mention for admin
  Given I am logged in as a user with the "administrator" role
  When I visit "admin/config/content/formats/manage/basic_html" 
  And I check "Mentions Filter"
  And I press the "Save configuration" button
  And I wait 5 seconds
  And I visit "admin/config/content/formats/manage/basic_html"
  And I wait 5 seconds
  And I visit "admin/structure/types/manage/page/fields/add-field"
  And I wait 5 seconds
  And I select "Text (plain, long)" from "Add a new field"
  And I fill in "Label" with "MyBody"
  And I press "Save and continue"
  And I wait 5 seconds
  And I press "Save field settings"
  And I wait 5 seconds
  And I press "Save settings"
  And I wait 5 seconds
  And I visit "node/add/page"
  And I wait 5 seconds
  And I fill in "Title" with "NewPage"
  And I fill in "MyBody" with "[@admin]"
  And I press the "Save and publish" button
  And I wait 5 seconds
  And I visit "admin/content"
  And I wait 5 seconds
  And I follow "NewPage"
  And I wait 5 seconds
  Then I should see the link "@admin"
