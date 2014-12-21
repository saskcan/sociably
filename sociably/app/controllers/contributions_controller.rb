class ContributionsController < ApplicationController
  before_action :set_person
  before_action :set_roles, only: [:new]
  before_action :set_books, only: [:new]

  #GET /people/1/contributions
  #GET .people/1/contributions.json
  def index
    @contributions = @person.contributions
  end

  #GET /people/1/contributions/new
  #GET /people/1/contributions/new.json
  def new
    @contribution = Contribution.new
  end

  #POST people/1/contributions
  #POST people/1/contributions.json
  def create
    @contribution = Contribution.new(contribution_params)
    @contribution.contributable_type = "Book"
    @contribution.person = @person

    respond_to do |format|
      if @contribution.save
        format.html { redirect_to person_contributions_path(@person), notice: 'Contribution was successfully created.' }
        format.json { render action: 'show', status: :created, location: person_contributions_path(@contribution) }
      else
        format.html { render action: 'new' }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end
    

private

  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_contribution
    @contribution = Contribution.find(params[:id])
  end

  def set_roles
    @roles = Role.all
  end

  def set_books
    @books = Book.all
  end

  def contribution_params
    params.require(:contribution).permit(:role_id, :contributable_id)
  end

end