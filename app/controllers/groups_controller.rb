class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  permits :name, :add_count

  # GET /groups
  def index
    @groups = Group.all
  end

  # GET /groups/1
  def show(page=1)
    @accounts = @group.accounts.order(id: :desc).page(page).per(50)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  def create(group)
    @group = Group.new(group)

    if @group.save
      redirect_to :root, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  # PUT /groups/1
  def update(group)
    if @group.update(group)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy

    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group(id)
      @group = Group.find(id)
    end
end
