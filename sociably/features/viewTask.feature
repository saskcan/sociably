Feature: View task
	In order to view a task
	A user
	Should click the task link from the list of tasks

	Scenario: Views a task
		Given I am on the tasks page
		When I click a task
		Then I should be taken to the task detail view